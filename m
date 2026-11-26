Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E781606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAnTwwbF;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=qtTfsd0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0BPEr2CtkW0LVXHE5zZamDMMf9lvAzljjICjnpx5fp0=; b=CAnTwwbFSvHN+Dv0sIo7kdjAdj
	Ix41mWYjqN9lrWWE9hfQpA12b5OlvAks1rwcstNjVj2o/wcvewNIub403/rXgdUMMajwKtz73Nwm/
	TxXR9oTc2BA1YWQeIO5DVYqEVolj55XlPyCRX6+ZEzjUXgFY+LSovQngneYZ04xztXpqDFrDbq5Al
	ht5D333EbLf7jr6YRH/8xHDNvX9IUyyT1IiuU5he3YGiibzRqJOLZT1AasHb1qYb6BMH091eTOXZJ
	bO0N+lVMjUI58VkvfW5m7Kf5RFX29mZWjE7qMJhumkMPJ2pKwwh6meCh+WknC7ihWTzEAtVN5Nfod
	aSF0U9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT6x-0000000CCvT-2AES;
	Thu, 26 Nov 2026 06:37:39 +0000
Received: from mail-japaneastazon11011035.outbound.protection.outlook.com ([52.101.125.35] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT6u-0000000CCv7-0zq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Df2/x6Jfgf7QKG794WdIL6tDK4FJTmkGw4E9a+Rtd11bXFyu6vv9htXY3nckriNdiRXJV8waR+LaeRMo38r36jWXlwiuspdmk7xtsKRWwLHqFTC7otsV3FO72g2VtfCivcmGmAUEnAe8A+98dv1fFeWmtJ+4OIDiMUAqIZ2S/uGwJ7BYbZjeV693YWMFFFo7DyxHOxLTh19qYdYRarbOxAGBwkS7Ls2woJhx44QMVY860uMZ85osvGdZyi5tIbPMHuFE2VVeuA5RA78G/B955T7YG4hbQB6wNBjQjz8eDvfS1nEm7p5yFU6cUgiAX8LZbSavLy9Q1IdD+PwE3LgBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BPEr2CtkW0LVXHE5zZamDMMf9lvAzljjICjnpx5fp0=;
 b=G9/yu6/IGx2UfJXi3NAE4usjavmo3C6Cwykp50m3MGWDLmqQIcKS99+ykVrpL/DvCU0bdMMuU6z/Wp8kczpLGt5BZxxiMhaEJchdMENUee+hyVk4fiU+Gy4EA90+IsoVcqhh5MhBnxT+6NYv4iHy8llQrrCH7N00yInYjmitoTbb1TTcj8eqh/wIQ9UPRn5cH9K9JXN6K05RAHHThzaCmnkZxlx1Go8Tj3SWcnpchJjgoBm2lJtOxRwT8ApgRBaxI6ouErrRhFY8sJMB2pFryK9UPxyQDSKKQZIASNP3hd52R4DuDRkq6s2pztDukcjVkZqOnyhdKfEHN70L7Dc2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BPEr2CtkW0LVXHE5zZamDMMf9lvAzljjICjnpx5fp0=;
 b=qtTfsd0ejPVxaw6NF21nEFHAIyVN7HSQ3yDX/vH4wNf5H5aaO3AxzepGyrmiNQzmFwXJnaRjt4mkzFhVBtAmCy19kMBK1ijAuqQZ5eeRqmZlTx5RR3QSBWq7+WSGNliQ3LaJu6UrWCUQba+2oA7qmIrjunxsC4rFQ0b1sD9mhnxfdAcnc28YwjPzmMhXPK7m3rBmbH7Y+tqxrX3OcUv88jo0mDuEKM3LpD9PyM6FYZnT0+u9vBgLPMu94wEdM/M9tF1+HQuR3GFnKSrEFN4GBU8HB6wM4GJkQXYxitGuxavan5CIYWfUC5L4Am0p3+cuaiKWqeUGsHgbLOdh1j+g5A==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OSBPR01MB16288.jpnprd01.prod.outlook.com
 (2603:1096:604:3f8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 06:37:31 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:37:31 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Fenghua Yu <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Will Deacon
	<will@kernel.org>, Dave Martin <Dave.Martin@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Chen Yu <yu.c.chen@intel.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Vikram Sethi
	<vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
	<newtonl@nvidia.com>, Richard Cheng <icheng@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v3 06/15] arm_mpam: Support memory-level MSCs and ABMC
 per class
Thread-Topic: [PATCH RFC v3 06/15] arm_mpam: Support memory-level MSCs and
 ABMC per class
Thread-Index: AQHdcJDAaP0pVKlpmkCa0fcqyr7P/bc//5Gz
Date: Thu, 26 Nov 2026 06:37:31 +0000
Message-ID: <TY4PR01MB169303842F27EDED635F191688B422@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-7-fenghuay@nvidia.com>
In-Reply-To: <20261109212427.1409204-7-fenghuay@nvidia.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-11-26T06:37:21.850Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OSBPR01MB16288:EE_
x-ms-office365-filtering-correlation-id: b8019334-da31-4c82-a2e7-08df4b87bf37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|1580799027|921020|4143699003|261026121527099003|56012099006|11063799006|261028144727099003|5023799004|261026140227099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: WG+RErTWb+LVoYJFxP8n/LnyePqBN/TDIB4kUKrCWR9hyZujb9iZYL8owIWdZDoIZFPXQmuupybuM1zD+APZfuqkOdvSOucdNO61RH/H1CGJ6zcqBf29ubHQvzeCHOMG/57kg9K0WzcJmhuMuDSEuTX+XO+sHzsE47peJg7HxEDtblgXo5TVvzQ19NtO/o9lZQ4WG9XeMAr/gda0etk4vrs481w3QEinK5QDLOA7gHqm0kM2AOCUB6QsKdzf4S5ONZhvzxZCehpeYl1tFvrM/FaXQeB6mjbmoI5F8GB2UOLGW2bGp3DlZzidm3YQ8+dIeRViSlc6g6mvwfqFUcWTZyFyDT1RxTg1nAqtLOp88X1Etr8mV6B4wfeumbxJdSIOIS4xT8dfpw5cLaSk3wjI01nOR6TYPlk34LtnPa/gzKk2kwHbqsYKUvbHun/nkXBUFSCSeTD57NTscKkIN9mzx8zEV3q1fGnkLuQHfxAFk/vaeuROvX6xynPPzXBCm0cr58p25Tbtb7JdFQ1gmt7NL515sLFNTmuXRhDoiOZORjrIRNqVVaEbsHidSs04F13yoOe5E+mGDIr5mOUFYncEWn+kaYqvX1sc/SYk/o4A5tkEQXH0pKcitK4aSTP1x7WuG4l3tGPrfTm7lVUYnrity2J5WHpDWitskhmzXs7xj8qbZa3Y3um9xUQgQymrEdZm1WfczY8LuX8nDp5jjJFBeZyHkg/Tev45aWrfOa9BzpZEmL2vK7THq6n1iDxkom2/gbIms28ck5YgUoVBmT1DuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(1580799027)(921020)(4143699003)(261026121527099003)(56012099006)(11063799006)(261028144727099003)(5023799004)(261026140227099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OWIvelAvVUg4N1FoR05LY2M1b28yV29vTFFCWE1iNzZSWkdUOUN3REhF?=
 =?iso-2022-jp?B?ME5EbHdYcHNpRWZyMm8wNzRQYVNWOGljR0VpVWd3YVZVVEE0Ti9lYkdM?=
 =?iso-2022-jp?B?TmFUMS80OTJCSFJsTFdYNDRUNStOSkpoeHROamJqRXB1N1VLVWd4Nklt?=
 =?iso-2022-jp?B?Wk5TRXVQaGRpcFBiSW9NYnlHU3kxbytOaTJ0WTZLM0d4ckFvekwxMjIw?=
 =?iso-2022-jp?B?SnI5YWFGcitDMWJrc1JiYmNGbXdycmFhY1BtaUVuT3ZodEsyekhrcGNR?=
 =?iso-2022-jp?B?ZXovRGdIeEpYYkVNR1hWR2lURGZnQkpQUGxsTWVtRUZBZ0NxT2NMTysv?=
 =?iso-2022-jp?B?VW1xWWlhaHZpYk1nUzM5ZFBqYXZvclpERnlJRVh4ZTdWVUlzV3N6MkJm?=
 =?iso-2022-jp?B?SnJ5V2VEV1pWVkFZMnlUc09EeTBScy84SEJqejdHODdRQ2hmZHhBbGRD?=
 =?iso-2022-jp?B?RjRCd3gxWFJzY3Vrdlg3RGYxeHNucVBPSDZsa20ySmU3Y2YveDIrdzds?=
 =?iso-2022-jp?B?TkhhdldXWjNVWXI0ZTFTd2t0V0tUT0R3RzZtTFhFSGMyZVBYS0tjcEhi?=
 =?iso-2022-jp?B?L0M3ZVgrZUZwenRDd2lLTkxVNEZyNVU3Vmg4NDJwenYxRWFwNE5wYWtq?=
 =?iso-2022-jp?B?NDZyakVLbG81ZUNzUVpGb2k5elJLOXZwcHlSOWR4d21rV1VVTXVxS2JY?=
 =?iso-2022-jp?B?Q0pIUlFZWE9vUG04VGZXN0JYd1JRQjJURS9mY2YrRU9sNFVwSUE1Nzds?=
 =?iso-2022-jp?B?QlFHYVFlaXFhMi80ZCtIbEg0RHVBaWdCUEpiNjJCRm03d1FJNUdxWWhO?=
 =?iso-2022-jp?B?dUtCQTJlUHpFR0dnQ3Y0ZVR1N2lJWFJ2a0N1ZWhxcWIzdzRRcXlOVnZi?=
 =?iso-2022-jp?B?bENYbHhQSXhsL0ZZQVlQdDlSTVVGWUNnR1grOEVDbkZUM2NIR3l5RHpX?=
 =?iso-2022-jp?B?UEd5VldGQzJ4Z2V0eVZ4OU5wNW5qbjJpVUFSOVhjTWdHTEhrWDdOYzRp?=
 =?iso-2022-jp?B?anJVa0ltNmJaQkhGRjE4Q2U3Uk0vNGVnaGFYWENXUUFHUno0MGJKMERr?=
 =?iso-2022-jp?B?b0tVRFZlVTRKbHUxdm9yWlRldDRwVFlhWlV2dDF4TEU4aGx4emQwRDlZ?=
 =?iso-2022-jp?B?TFhERU5mUmpvSWxCdkhrVDlLZmNkWFBGNFNCVngrb0F5clZuUUhUbm1i?=
 =?iso-2022-jp?B?emN0SzA5RStETlpNK3ByaSs1UmRtU2JEcHU2ZVYrZ3JwNnNsQnp6dlJh?=
 =?iso-2022-jp?B?Zng1ZDlyOUR0OHRrZ3dQbnkzQXY5QUV1VDZSRUxJTW9qd3pxN1lVVW5t?=
 =?iso-2022-jp?B?ZkVaV1UxcnplRjJPZmVlSUVWbHl5WTJGcitQUXlkV2lJYVhMVDhoQ1V2?=
 =?iso-2022-jp?B?ZXpaaDdidGhHTVJoUzk1OTFRTlRTK1FXRWZaWFcvdVl6YUs1QThDNVlK?=
 =?iso-2022-jp?B?d2RmQk9lUjYvRzRHYWQ1dWltNE40VUt0MDZjWkx1UHVyVmJQVHlBY2Rt?=
 =?iso-2022-jp?B?ZkFKMzEzblI5ZFl6c2xjeTBOZWlnaGh2RFZQZ3Z2TFlsblZidTJ6bzBw?=
 =?iso-2022-jp?B?dUVoUEQ2SHFVY2hURnNUNkkwMHdrazczYUtpUEhVUlpNR3NtZGFkdDR4?=
 =?iso-2022-jp?B?a1RZOXAyem9aOWRQSXI0bkEzR0o1Z0MwdFpDZTdFQWh5WVl3REp4b3V6?=
 =?iso-2022-jp?B?RDR3SUlFSGJ0VGpvTTh5U29IakFyRG5HUEFGdVp1VWlXS0dyalMwU3RQ?=
 =?iso-2022-jp?B?bjBGOENFdGU3SjBLQkc2YkFjOTBwNWlWcFFwcFRzcEd3UTFqTXJxZGNp?=
 =?iso-2022-jp?B?enJzVWhaWFowNk5xdWRVS0RIYm1veGhwSERFUGk1TXpvYVF4VE9jY0FP?=
 =?iso-2022-jp?B?SGcvMGF4VzJwUG1nNFJyTXdFQy9mOTV4M3IvYWFtOUc0VGRHTTZyZGox?=
 =?iso-2022-jp?B?TWcrWWVKWjVzbVZWbFJJRXdxK2xMSmtqUFEvWmc3YWk3aFc0NERUVXB1?=
 =?iso-2022-jp?B?allNSmRoOUJ4cEJQeDlVZ3ZHaWpkR3QxbnorbjRZZUdWMWpnbGV2TWtE?=
 =?iso-2022-jp?B?ZHJabzIvL2hGejBudjhzUWM2ZkpNNUZoQWhLWUpkLy9XL1ozOUVMOWlu?=
 =?iso-2022-jp?B?N3BadkVZbThkVnkxbE5jWWJJU3ZHRExoZ3dKdTlJRmZiTkxQbEpHTm16?=
 =?iso-2022-jp?B?ZkxUVVU0YVNJem9vK3ZwcnZJTDVmeUV0L1J2RkxqZFh5ZXVEdmYyR3Zz?=
 =?iso-2022-jp?B?My96eVg3clc2N2Y1NW9aNjFVMXFxcXp2TmlBb2c1Y0Flc01qZHFZMGFZ?=
 =?iso-2022-jp?B?eTZVSUNjZU1scjluMlZaU1NYbHVJWUVuUllaVVhNeWRzdzVjdnpXeUwv?=
 =?iso-2022-jp?B?cjhxQkgvakRTWW52NENkdkwzZVNDUFhJeVZtSytrV2hzV3d1S1JhaVZw?=
 =?iso-2022-jp?B?bExjSFI2ZVNkVXZTa084UGM5RmN2UDlDam9GL3FnOCtNL2cvNzBFbmkr?=
 =?iso-2022-jp?B?ZVhWWFR0SmpKSGIwYVNpZDltRzRUY2s1OFNUdz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IK93GhFp1A6jUATLfRwfzk7DHVJbNk8EKEyNwYi1KkphcuKcvziXUZan2EPejgEbznSufDvXwm39ievptgINZ2Th6am1rFniwqRQd4N6jEVAKNPrCW39eZUWV3yAP0Jts4dz1wgBYG1gbKeH6oNJ8N7sVT01Y4Ne7Eijhp7g9YjGbz0d8CPkpT30I3pAoenoynSxUd819/bi+o3igx9uGsxHrJcqbXnJXZr4eleXM3pQmDpLEhgow8KKmN1Pwfhh1lZyo8McjHTNd+4QFq7J6vH/IfAzCrjKk8SOCiQfINFSsKyhQrGVVoX6sGknHyO4LdNawkxNfGNquYkjRutwnw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8019334-da31-4c82-a2e7-08df4b87bf37
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 06:37:31.0286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KrClPtlv7tdU8E4LX6k/E5P1cUJsx7Jz7tpgtLGEDYbC8DaUqhd0wwdyw0ghYD6z2wtIPLH7P1Ej74ExW7p+KS68utT3bfYmwLVkS47hLDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB16288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_223736_392952_F5C4AE4E 
X-CRM114-Status: GOOD (  17.85  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Fenghua,=0A=
=0A=
> Reinette Chatre <reinette.chatre@intel.com>;Tony Luck <tony.luck@intel.co=
m>;Ben Horgan <ben.horgan@arm.com>;James Morse <james.morse@arm.com>;=0A=
> linux-kernel@vger.kernel.org;linux-arm-kernel@lists.infradead.org;Fenghua=
 Yu <fenghuay@nvidia.com>=0A=
> =0A=
> =0A=
> Some platforms place MBWU counters on a memory MSC above L3 while CSU=0A=
> occupancy may remain on the L3 cache MSC. The driver previously assumed=
=0A=
> all monitors and ABMC state lived on the L3 resource, which=0A=
> mis-associates MBA counters, breaks mbm_L3_assignments when multiple=0A=
> events share a class, and uses the wrong domain ID space for=0A=
> memory-level MSCs.=0A=
> =0A=
> Teach MPAM resctrl to map monitor classes to L3 or MBA resources,=0A=
> initialise ABMC on the resource that owns the MBWU monitor, select the=0A=
> node-scope MBM total event for memory-side counters, and test=0A=
> mbm_cntr_assignable instead of inferring assignment support from=0A=
> whichever monitor happens to share res->class first.=0A=
> =0A=
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>=0A=
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++++++---------=
=0A=
>  1 file changed, 81 insertions(+), 31 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index ca2ae4b5cc8a..47a7b18d841d 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RD=
T_NUM_RESOURCES];=0A=
>   * to those supported by MPAM.=0A=
>   * Class pointer may be NULL.=0A=
>   */=0A=
> -#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID=0A=
> +#define MPAM_MAX_EVENT QOS_NODE_MBM_TOTAL_EVENT_ID=0A=
>  static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1]=
;=0A=
>  =0A=
>  #define for_each_mpam_resctrl_mon(mon, eventid)                         =
        \=0A=
> @@ -88,6 +88,11 @@ bool resctrl_arch_alloc_capable(void)=0A=
>          return false;=0A=
>  }=0A=
>  =0A=
> +static bool mpam_class_memory(struct mpam_class *class)=0A=
> +{=0A=
> +       return class && class->type =3D=3D MPAM_CLASS_MEMORY && class->le=
vel > 3;=0A=
> +}=0A=
> +=0A=
>  bool resctrl_arch_mon_capable(void)=0A=
>  {=0A=
>          struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESO=
URCE_L3];=0A=
> @@ -121,7 +126,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r,=
 struct rdt_l3_mon_domain *d=0A=
>  =0A=
>  bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)=0A=
>  {=0A=
> -       return (r =3D=3D &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_=
res);=0A=
> +       /*=0A=
> +        * mbm_cntr_assignable is set only when ABMC is initialised on th=
is=0A=
> +        * resource. Multiple monitor events may share res->class (e.g.=
=0A=
> +        * occupancy and MBWU), so assignment support must not be inferre=
d=0A=
> +        * from mon->assigned_counters via a class lookup on the wrong ev=
ent.=0A=
> +        */=0A=
> +       return r->mon.mbm_cntr_assignable;=0A=
>  }=0A=
>  =0A=
>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable=
)=0A=
> @@ -181,24 +192,41 @@ static void resctrl_reset_task_closids(void)=0A=
>          read_unlock(&tasklist_lock);=0A=
>  }=0A=
>  =0A=
> -static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)=
=0A=
> +static struct=0A=
> +mpam_resctrl_res *mpam_resctrl_res_from_mon(struct mpam_resctrl_mon *mon=
)=0A=
>  {=0A=
> -       struct mpam_resctrl_mon *mon =3D &mpam_resctrl_counters[QOS_L3_MB=
M_TOTAL_EVENT_ID];=0A=
> +       struct mpam_resctrl_res *res;=0A=
> +       enum resctrl_res_level rid;=0A=
>  =0A=
>          if (!mon->class)=0A=
> -               return;=0A=
> +               return NULL;=0A=
> +=0A=
> +       for_each_mpam_resctrl_control(res, rid) {=0A=
> +               if (res->class =3D=3D mon->class)=0A=
> +                       return res;=0A=
> +       }=0A=
> +=0A=
> +       return NULL;=0A=
> +}=0A=
> +=0A=
> +static struct mpam_resctrl_mon *mpam_resctrl_mbm_total_mon(void)=0A=
> +{=0A=
> +       if (mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID].class)=0A=
> +               return &mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID=
];=0A=
> +=0A=
> +       return &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];=0A=
> +}=0A=
> +=0A=
> +static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)=
=0A=
> +{=0A=
> +       struct mpam_resctrl_mon *mon =3D mpam_resctrl_mbm_total_mon();=0A=
>  =0A=
> -       if (!mon->assigned_counters)=0A=
> +       if (!mon->class || !mon->assigned_counters)=0A=
>                  return;=0A=
>  =0A=
> -       l3->mon.num_mbm_cntrs =3D mon->class->props.num_mbwu_mon;=0A=
> +       r->mon.num_mbm_cntrs =3D mon->class->props.num_mbwu_mon;=0A=
>          if (cdp_enabled)=0A=
> -               l3->mon.num_mbm_cntrs /=3D 2;=0A=
> -=0A=
> -       /*=0A=
> -        * Continue as normal even if enabling cdp causes there to be=0A=
> -        * zero counters. This avoids giving resctrl mixed messages.=0A=
> -        */=0A=
> +               r->mon.num_mbm_cntrs /=3D 2;=0A=
>  }=0A=
>  =0A=
>  int resctrl_arch_set_cdp_enabled(struct rdt_resource *r, struct resctrl_=
ctrl *ctrl,=0A=
> @@ -404,6 +432,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum re=
sctrl_event_id evtid)=0A=
>                  return mpam_alloc_csu_mon(mon->class);=0A=
>          case QOS_L3_MBM_LOCAL_EVENT_ID:=0A=
>          case QOS_L3_MBM_TOTAL_EVENT_ID:=0A=
> +       case QOS_NODE_MBM_TOTAL_EVENT_ID:=0A=
>                  return USE_PRE_ALLOCATED;=0A=
>          default:=0A=
>                  return -EOPNOTSUPP;=0A=
> @@ -1160,7 +1189,10 @@ static void mpam_resctrl_pick_counters(void)=0A=
>                           * and it's equivalent to mbm_total and so alway=
s use=0A=
>                           * mbm_total.=0A=
>                           */=0A=
> -                       counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, c=
lass);=0A=
> +                       if (class->type =3D=3D MPAM_CLASS_MEMORY)=0A=
> +                               counter_update_class(QOS_NODE_MBM_TOTAL_E=
VENT_ID, class);=0A=
> +                       else=0A=
> +                               counter_update_class(QOS_L3_MBM_TOTAL_EVE=
NT_ID, class);=0A=
>                  }=0A=
>          }=0A=
>  }=0A=
> @@ -1187,7 +1219,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *=
r, struct rdt_l3_mon_domain *=0A=
>  {=0A=
>          struct mpam_resctrl_mon *mon =3D &mpam_resctrl_counters[evtid];=
=0A=
>  =0A=
> -       if (evtid !=3D QOS_L3_MBM_TOTAL_EVENT_ID) {=0A=
> +       if (!resctrl_is_mbm_total_event(evtid)) {=0A=
>                  pr_debug("unexpected event id\n");=0A=
>                  return;=0A=
>          }=0A=
> @@ -1204,7 +1236,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *=
r, struct rdt_l3_mon_domain *=0A=
>                  __config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assi=
gn);=0A=
>          }=0A=
>  =0A=
> -       resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_T=
OTAL_EVENT_ID);=0A=
> +       resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);=0A=
>  }=0A=
>  =0A=
>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)=0A=
> @@ -1303,10 +1335,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, s=
truct mpam_component *comp)=0A=
>   */=0A=
>  static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)=
=0A=
>  {=0A=
> -       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_L3];=0A=
>          size_t num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
> -       struct rdt_resource *l3 =3D &res->resctrl_res;=0A=
>          struct mpam_class *class =3D mon->class;=0A=
> +       struct mpam_resctrl_res *res;=0A=
> +       struct rdt_resource *r;=0A=
>          u16 num_mbwu_mon;=0A=
>          int *cntrs;=0A=
>  =0A=
> @@ -1317,6 +1349,12 @@ static int mpam_resctrl_monitor_init_abmc(struct m=
pam_resctrl_mon *mon)=0A=
>          }=0A=
>          memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));=0A=
>  =0A=
> +       res =3D mpam_resctrl_res_from_mon(mon);=0A=
> +       if (!res)=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       r =3D &res->resctrl_res;=0A=
> +=0A=
>          num_mbwu_mon =3D class->props.num_mbwu_mon;=0A=
>          cntrs =3D __alloc_mbwu_array(mon->class, num_mbwu_mon);=0A=
>          if (IS_ERR(cntrs))=0A=
> @@ -1324,12 +1362,12 @@ static int mpam_resctrl_monitor_init_abmc(struct =
mpam_resctrl_mon *mon)=0A=
>          mon->assigned_counters =3D cntrs;=0A=
>          mon->mbwu_idx_to_mon =3D no_free_ptr(rmid_array);=0A=
>  =0A=
> -       l3->mon.mbm_cntr_assignable =3D true;=0A=
> -       l3->mon.mbm_assign_on_mkdir =3D true;=0A=
> -       l3->mon.mbm_cntr_configurable =3D false;=0A=
> -       l3->mon.mbm_cntr_assign_fixed =3D true;=0A=
> +       r->mon.mbm_cntr_assignable =3D true;=0A=
> +       r->mon.mbm_assign_on_mkdir =3D true;=0A=
> +       r->mon.mbm_cntr_configurable =3D false;=0A=
> +       r->mon.mbm_cntr_assign_fixed =3D true;=0A=
>  =0A=
> -       mpam_resctrl_monitor_sync_abmc_vals(l3);=0A=
> +       mpam_resctrl_monitor_sync_abmc_vals(r);=0A=
>  =0A=
>          return 0;=0A=
>  }=0A=
> @@ -1337,8 +1375,15 @@ static int mpam_resctrl_monitor_init_abmc(struct m=
pam_resctrl_mon *mon)=0A=
>  static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,=0A=
>                                       enum resctrl_event_id type)=0A=
>  {=0A=
> -       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_L3];=0A=
> -       struct rdt_resource *l3 =3D &res->resctrl_res;=0A=
> +       struct mpam_resctrl_res *res;=0A=
> +       struct rdt_resource *r;=0A=
> +=0A=
> +       if (mpam_class_memory(mon->class))=0A=
> +               res =3D &mpam_resctrl_controls[RDT_RESOURCE_MBA];=0A=
> +       else=0A=
> +               res =3D &mpam_resctrl_controls[RDT_RESOURCE_L3];=0A=
> +=0A=
> +       r =3D &res->resctrl_res;=0A=
>  =0A=
>          lockdep_assert_cpus_held();=0A=
>  =0A=
> @@ -1365,8 +1410,13 @@ static int mpam_resctrl_monitor_init(struct mpam_r=
esctrl_mon *mon,=0A=
=0A=
Question: In the function mpam_resctrl_monitor_init(), is it necessary to c=
heck for the presence of an L3 cache on CPU-less nodes?=0A=
	    /*=0A=
	     * There also needs to be an L3 cache present.=0A=
	     * The check just requires any online CPU and it can't go offline as w=
e=0A=
	     * hold the cpu lock.=0A=
	     */=0A=
	    if (get_cpu_cacheinfo_id(raw_smp_processor_id(), 3) =3D=3D -1)=0A=
	        return 0;=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
>           * monitoring class.=0A=
>           * Setting name is necessary on monitor only platforms.=0A=
>           */=0A=
> -       l3->name =3D "L3";=0A=
> -       l3->mon_scope =3D RESCTRL_L3_CACHE;=0A=
> +       if (mpam_class_memory(mon->class)) {=0A=
> +               r->name =3D "MB";=0A=
> +               r->mon_scope =3D RESCTRL_NODE;=0A=
> +       } else {=0A=
> +               r->name =3D "L3";=0A=
> +               r->mon_scope =3D RESCTRL_L3_CACHE;=0A=
> +       }=0A=
>  =0A=
>          /*=0A=
>           * num-rmid is the upper bound for the number of monitoring grou=
ps that=0A=
> @@ -1376,9 +1426,9 @@ static int mpam_resctrl_monitor_init(struct mpam_re=
sctrl_mon *mon,=0A=
>           * this does mean userspace needs to know the architecture to co=
rrectly=0A=
>           * interpret this value.=0A=
>           */=0A=
> -       l3->mon.num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
> +       r->mon.num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
>  =0A=
> -       if (type =3D=3D QOS_L3_MBM_TOTAL_EVENT_ID) {=0A=
> +       if (type =3D=3D QOS_L3_MBM_TOTAL_EVENT_ID || type =3D=3D QOS_NODE=
_MBM_TOTAL_EVENT_ID) {=0A=
>                  int err;=0A=
>  =0A=
>                  err =3D mpam_resctrl_monitor_init_abmc(mon);=0A=
> @@ -1386,13 +1436,13 @@ static int mpam_resctrl_monitor_init(struct mpam_=
resctrl_mon *mon,=0A=
>                          return err;=0A=
>  =0A=
>                  static_assert(MAX_EVT_CONFIG_BITS =3D=3D 0x7f);=0A=
> -               l3->mon.mbm_cfg_mask =3D MAX_EVT_CONFIG_BITS;=0A=
> +               r->mon.mbm_cfg_mask =3D MAX_EVT_CONFIG_BITS;=0A=
>          }=0A=
>  =0A=
>          if (!resctrl_enable_mon_event(type, false, 0, NULL))=0A=
>                  return -EINVAL;=0A=
>  =0A=
> -       l3->mon_capable =3D true;=0A=
> +       r->mon_capable =3D true;=0A=
>  =0A=
>          return 0;=0A=
>  }=0A=
> --=0A=
> 2.53.0=0A=

