<?php

 

return [
    'adminEmail' => 'admin@example.com',
        
    'pagination' => [
        10 => 10,
        20 => 20,
        50 => 50,
        100 => 100,
        200 => 200,
        500 => 500,
    ],

    'payment_status' => [
        0 => 'Unpaid',
        1 => 'Paid',
    ],



    'notification_pages' => [
        0 => [
            'controller' => 'quotation',
            'title'      => 'Quotations',
            'icon'       => 'fa fa-book',
        ],
        1 => [
            'controller' => 'purchase-order',
            'title'      => 'Purchase Orders',
            'icon'       => 'fa fa-shopping-cart'
        ],
        2 => [
            'controller' => 'job-order',
            'title'      => 'Job Orders',
            'icon'       => 'fa fa-wrench'
        ],
        3 => [
            'controller' => 'daily-output',
            'title'      => 'Daily Output',
            'icon'       => 'fa fa-calendar'
        ],
        4 => [
            'controller' => 'acknowledgment-receipt',
            'title'      => 'Acknowledgment Receipt',
            'icon'       => 'fa fa-folder'
        ],
        5 => [
            'controller' => 'sales-invoice',
            'title'      => 'Sale Invoice',
            'icon'       => 'fa fa-money'
        ],
        6 => [
            'controller' => 'official-receipt',
            'title'      => 'Official Receipt',
            'icon'       => 'fa fa-file'
        ],
        7 => [
            'controller' => 'user',
            'title'      => 'User Signup',
            'icon'       => 'fa fa-user'
        ],
    ],

    
    'delivery_status' => [
        0 => 'Delivered',
        1 => 'In Transit',
    ],
    'payment_type_id' => [
        0 => 'Complete Payment',
        1 => 'Partial Payment',
    ],

    'watermark' => [
        0 => 'Without Watermark',
        1 => 'With Watermark',
    ],

    'default' => [
        'profile' => 'uploads/profile.png',
        'default_role' => 0,
        'pagination' => 10,
        'timezone' => 'America/Los_Angeles',
        'quotation_no_padding' => 5,
        'quotation_no_prefix' => 'KPI-Q-',
        'jo_no_padding' => 5,
        'jo_no_prefix' => 'KPI-JO-',
        'company_name' => '',
        'company_address' => '',
        'company_tag_line' => '',
        'company_description' => '',
        'company_phone_no' => '',
        'company_fax_no' => '',
        'form_of_business' => '',
        'line_of_business' => '',
        'tin' => '',
        'reg_no' => '',
        'twitter' => '',
        'facebook' => '',
        'google' => '',
        'email' => '',
        'notification_pages' => [],
        'si_no_padding' => 5,
        'si_no_prefix' => '',
        'ar_no_padding' => 5,
        'ar_no_prefix' => '',
        'company_logo' => '',
        'menu' => [
            'dashboard' => [
                'title' => 'Dashboard',
                'icon' => 'fa fa-dashboard',
            ],

            'quotation' => [
                'title' => 'Quotations',
                'icon' => 'fa fa-edit',
            ], 
            'purchase-order' => [
                'title' => 'Purchase Orders',
                'icon' => 'fa fa-shopping-cart',
            ],

            'job-order' => [
                'title' => 'Job Orders',
                'icon' => 'fa fa-shopping-cart',
            ],

            'acknowledgment-receipt' => [
                'title' => 'Acknowledgment receipt',
                'icon' => 'fa fa-shopping-cart',
            ],

            'sales-invoice' => [
                'title' => 'Sales Invoice',
                'icon' => 'fa fa-shopping-cart',
            ],

            'daily-output' => [
                'title' => 'Daily Outputs',
                'icon' => 'fa fa-book',
            ], 

            'user' => [
                'title' => 'Users',
                'icon' => 'fa fa-group',
            ],  
            'profile' => [
                'title' => 'Profiles',
                'icon' => 'fa fa-user',
            ],  

            'log' => [
                'title' => 'Logs',
                'icon' => 'fa fa-book',
            ], 

            'announcement' => [
                'title' => 'announcement',
                'icon' => 'fa fa-book',
            ], 

            '#stock' => [
                'title' => 'Stocks',
                'icon' => 'fa fa-gear',
                'sub' => [
                    'base-stock' => [
                        'title' => 'Base Stock',
                        'icon' => 'fa fa-user-secret',
                    ],

                    'base-stock-issue' => [
                        'title' => 'Issue Stock',
                        'icon' => 'fa fa-user-secret',
                    ],

                    'base-stock-category' => [
                        'title' => 'Category',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'base-stock-unit' => [
                        'title' => 'Unit',
                        'icon' => 'fa fa-user-secret',
                    ],
                ]
            ],


            '#cms' => [
                'title' => 'CMS',
                'icon' => 'fa fa-gear',
                'sub' => [
                    'mode-of-payment' => [
                        'title' => 'Mode of Payment',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'portfolio-category' => [
                        'title' => 'Portfolio Category',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'portfolio' => [
                        'title' => 'Portfolio',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'equipment-category' => [
                        'title' => 'Equipment Category',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'equipment' => [
                        'title' => 'Equipment',
                        'icon' => 'fa fa-user-secret',
                    ],

                    'service' => [
                        'title' => 'Services',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'product' => [
                        'title' => 'Product',
                        'icon' => 'fa fa-shopping-cart',
                    ],
                    'specification' => [
                        'title' => 'specifications',
                        'icon' => 'fa fa-edit',
                    ],
                    'type-of-service' => [
                        'title' => 'Type Of Service',
                        'icon' => 'fa fa-edit',
                    ],
                    'trade-reference' => [
                        'title' => 'Trade Reference',
                        'icon' => 'fa fa-edit',
                    ],
                    'dashboard-carousel' => [
                        'title' => 'Dashboard Carousel',
                        'icon' => 'fa fa-edit',
                    ],
                ]
            ], 

            '#settings' => [
                'title' => 'Settings',
                'icon' => 'fa fa-gear',
                'sub' => [
                    'role' => [
                        'title' => 'Roles',
                        'icon' => 'fa fa-user-secret',
                    ],
                    'setting' => [
                        'title' => 'General',
                        'icon' => 'fa fa-cog',
                    ],
                ]
            ],  
        ],
        'or_no_padding' => 5,
        'or_no_prefix' => '',
        'maximum_request_amount_restriction' => 10000,
        'terms_and_condition' => '',
        'privacy_policy' => '',

    ],

    'default_profile' => 'uploads/profile.png',
    'default_role' => 0,
    'default_pagination' => 10,
    'default_timezone' => 'America/Los_Angeles',


    'notification_status' => [
        0 => [
            'id' => 0,
            'title' => 'Unread',
            'class' => 'danger'
        ],

        1 => [
            'id' => 1,
            'title' => 'Read',
            'class' => 'success'
        ],
    ],

    'process_status' => [
        0 => [
            'id' => 0,
            'title' => 'Pending',
            'class' => 'warning'
        ],

        1 => [
            'id' => 1,
            'title' => 'Quoted',
            'class' => 'primary'
        ],

        2 => [
            'id' => 2,
            'title' => 'No Bid',
            'class' => 'default'
        ],

        3 => [
            'id' => 3,
            'title' => 'Cancelled',
            'class' => 'danger'
        ],

        4 => [
            'id' => 4,
            'title' => 'Purchase Order',
            'class' => 'success'
        ],
    ],


    'po_process_status' => [
        0 => [
            'id' => 0,
            'title' => 'Pending',
            'class' => 'warning'
        ],

        1 => [
            'id' => 1,
            'title' => 'Job Order',
            'class' => 'success'
        ],

        2 => [
            'id' => 2,
            'title' => 'Partial Served',
            'class' => 'primary'
        ],

        3 => [
            'id' => 3,
            'title' => 'Complete Served',
            'class' => 'success'
        ],
        4 => [
            'id' => 4,
            'title' => 'Cancelled',
            'class' => 'danger'
        ],
    ],


    'jo_process_status' => [
        0 => [
            'id' => 0,
            'title' => 'Pending',
            'class' => 'warning'
        ],

        1 => [
            'id' => 1,
            'title' => 'Unserved',
            'class' => 'info'
        ],

        2 => [
            'id' => 2,
            'title' => 'Partial Served',
            'class' => 'primary'
        ],

        3 => [
            'id' => 3,
            'title' => 'Complete Served',
            'class' => 'success'
        ],
        4 => [
            'id' => 4,
            'title' => 'Cancelled',
            'class' => 'danger'
        ],
    ],


    'ar_status' => [
        0 => [
            'id' => 0,
            'title' => 'Unserved',
            'class' => 'danger'
        ],

        1 => [
            'id' => 1,
            'title' => 'Partial Served ',
            'class' => 'primary'
        ],

        2 => [
            'id' => 2,
            'title' => 'Complete Served ',
            'class' => 'success'
        ],
    ],

    'inventory_status' => [
        0 => [
            'id' => 0,
            'title' => 'Out of Stock',
            'class' => 'danger'
        ],

        1 => [
            'id' => 1,
            'title' => 'Safe',
            'class' => 'primary'
        ],

        2 => [
            'id' => 2,
            'title' => 'Critical',
            'class' => 'warning'
        ],

        3 => [
            'id' => 3,
            'title' => 'Exceed',
            'class' => 'success'
        ],
    ],


    'user_status' => [
        0 => 'Not-Authorized',
        1 => 'Authorized',
    ],


    'record_status' => [
        0 => 'Not Active',
        1 => 'Active',
    ],
 
    
];
