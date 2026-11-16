Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCC606A886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ln6/xPW+;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ASVZaEBz;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vRsGl4IK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QOOpnVJ6AFiwVVZ8RISxTMZuNf5F3bWJGydI77R/yE=; b=Ln6/xPW+I0A6RX
	uAxLzJFgMPTsp6a+L6zXHeZDSCVm7RdJ9F6Qh1kXoypcuv2X7qxyUvZV4/5eVDUFSeJ/MXny/nF01
	VDpXf+z0R4RCcl5Va+hyNo8UaMVceeUkHYnCHP+3YcJJT9z7XEAAllVtDvLzqBSA4QjAuCjXOnAGY
	hue2iSIpOK8r1BxMYly+uxtlS8ytdd+ns10xGWGyHrBGX+93ysDG/IgiGdYTkeDy89NG6I0znBSzC
	Nodq7A7MuFewsq0J9aw/y4WCC1zQDGGvJrEuXuvCZ4v7pI5wKEHU+ktNawkzEM5H9k+78iUryDbhD
	vYIEzhyEtu5rog2Z66aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSs1p-00000001agJ-0adW;
	Mon, 16 Nov 2026 08:25:29 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSs1f-00000001aaT-46Ps
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:25:22 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1196R1485564;
	Mon, 16 Nov 2026 08:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1QOOpnVJ6AFiwVVZ8RISxTMZuNf5F3bWJGydI77R/yE=; b=
	ASVZaEBzk8ooJjBfovnuj47m4jaxaeiH53KzQiJgPCRmPBOiOTAt0ckN8deRO31z
	ew4dpmJ199Ex4dLUSF2fgiH7tD6diaOqLbsagoBDosX983yAvtVEGn2VS2ELnVMB
	6BML4YfrGuQ0vOhU3GwlFLVO52TZxU6G7av/aMosAHeFnhZm4KIsehxH6e08i9rW
	KtLQmar9lCY9vwtDX7ZyfRLEXqDD81f3+EGnc9ci6Oh6MBStzLr29GOirOQ9Adrj
	YYDvx5gi5MfAXD+lft5xCjmYHF7LEWPwkKLLVVGEg3RMMdp1P6ncuOcb7eoLc4Hf
	Kq0WSZiVng+bdPYfdYk9WA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hxee41mgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Nov 2026 08:24:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG8IUsK2181687;
	Mon, 16 Nov 2026 08:24:43 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hyv7pmb3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 08:24:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX9FnSYu+VcdPrI1LiSyzSAPlOl0/bsIMuHuVtuEt2HcaPTe0aJFoau1uxt/8VIXYoM4XRPYNjOwUO/0xbH5OrdU0XD0OjMF3VGSUplhEsy5gfD1HQQvpLxmRURzh8tDIdB3Da89zt3miuSk3uaLnunebsWBBXFtBstMj70/E4jR4f/HAPDVPhIAj3cn5hdRanXq0ZvsK45K8i6sAGfYrjvpw/T3RVbFNQo15fXK9Dond6BMJhtbtYHW7Gqa+IouWPMIJUcTmUI/Mes4r8jC1l8NiCBq5n767PyAWO1AIp2FC/hFP53YFLxHMUdLw828OFV/ZxJ0nqyKGU25zgwrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QOOpnVJ6AFiwVVZ8RISxTMZuNf5F3bWJGydI77R/yE=;
 b=c0REaXrao/Uxxw8Fkm31g4bIJTvvjgsc6n97pB1J8IGSKQrTwUU8N6Dg57O/3FQ+sHWYJ6uYmyLNE0lkVjaHviUd2Pzg3mAFcOnIpnN3K0K/2tOljv3f7i/bIOqLA6uvWdi4RH/sd3xMYU7sogrDHuG65ombJ3fkG2DDcmAS96qfNiQr0N0rBSHGvg3TFt2kVgF0Pya7Il+I2zIyo6eWxTGDbghfsQSyyzwb9Q/WrmHzNrCmWtxODnGt9iTXsHOX/oMq76+4xB1CGs7ImKHePQ5V7RgAtlDhVpZqy1isdbQpQwuNg90roxG5xMVTVMgy0mjGNnXmpPvPlUFkJElTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QOOpnVJ6AFiwVVZ8RISxTMZuNf5F3bWJGydI77R/yE=;
 b=vRsGl4IKYxvYNKTYN1siK0OKlvSRPSI240Ka/7ESnOESdBB7Oi6/63/L86nBbMrT0yjrZMuSBTwxogCekaJZVqxmS1KyMJ9zzhyOQ4Sczmh/bGVxoSZsyi0rVNzS3N9GEdIGaV0vVwHiLPTiwOClbUV4iCQUHtbbnvp7FZr8PPI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CH3PR10MB8216.namprd10.prod.outlook.com (2603:10b6:610:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:24:40 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::3c92:21f3:96a:b574%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:24:40 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
        peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
        harisokn@amazon.com, sahilchandna@linux.microsoft.com, cl@gentwo.org,
        ast@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
        memxor@gmail.com, zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
        rdunlap@infradead.org, david.laight.linux@gmail.com,
        broonie@kernel.org, boris.ostrovsky@oracle.com, ashok.bhat@arm.com,
        Ankur Arora <ankur.a.arora@oracle.com>
Subject: [PATCH v17 01/16] asm-generic: barrier: Add smp_cond_load_relaxed_timeout()
Date: Mon, 16 Nov 2026 02:24:22 -0600
Message-Id: <20261116082437.66739-2-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20261116082437.66739-1-ankur.a.arora@oracle.com>
References: <20261116082437.66739-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CH3PR10MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d69dd83-91ad-4da2-b9d6-08df43bb0efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|261009221227099003|3023799007|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: 6s/dL3KZ/MbOZsnRX/zc142300sjF+wQFUMC/xQdOWRANwErtv5DnClT2JHqnvN57WiQDr2fP5te30ObGJ9FIpx2hFIVc/8+HjSzZx5SGyjuUNqar4iyEYQ79MtTYTDdGCaBdcrgD96kLDBPPlRWxdabgtIbOeP/FEcwLmvyPYLlkDmlH54yyP5nTGtW8WvGFKmRp7cfDEJv9uAy8H7Sxdbt/DTruA00jiu71AgTwV5khmlL63dl4LE3GUjvnkFlWnf6NNCtCLb+BGfsfPAY4g4I+dlnTfvVANu6joHTWsrqxOd3RAR2AcsEqtAgmeqsFzZBylO0JaBwb+9RiNWoloBPKqq1hMv8AFlXjIjDnfhwxRyoFxeqpeh0nPvSvpeNjUL798t5SmG/9soo04bxCim9Z9eizy7Cn1Y9cuTyEV8QjH+98D4dogg5eSEfLAml8Q/kf7nHQG5KVTkgOgqmV87FfL8SI6lnIpG7UiShntsVRgFpxBis3Kis9E6G83Xgp0SPvLMwb8S2WtBo7gkIahPcbT5RC9EpjxDSL0kTzs49Kmt25liQw0ZRsosaitNIcZocyrteVGcmjbvfOQtdI/PjwGHsN12QeuL0bJVeQXlj6je+i7Xa89sAZwGFANH4EhakHFrMGDh24C4BfMaxpTl/k1/craq7cqQgi7+Ql9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(261009221227099003)(3023799007)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1eldMtFa4oIS3rmWeEjE237expblgIlWEqnSGL8wSypHBFLbeepRuL0la05X?=
 =?us-ascii?Q?e//qJCErVnnbdVV85mYuOcQZWvCKRo6id/XgctpWfmxwqGcalUJgJ3BIjo9K?=
 =?us-ascii?Q?DFc4OAol93Vbfv7+DviW4cg8J6FamSeeNlQwyDwYsXJZEtIPSXk2YIK0lddv?=
 =?us-ascii?Q?SdSQfFBoICYVAM5OayHPLQRcFAm5bFpZ7gXcw3LUvKqUTLslC4w7t2/uhRqh?=
 =?us-ascii?Q?0jCygHbJaPYWW0qv1CdqLhVdaooUk0C6LMOTmnpMeUcBVh+IHC+fOeNh1nN0?=
 =?us-ascii?Q?fwVHbeTz+85fIt5G7n1S2pC4XRz2xMUqkogs6CeZKvQ9gJ84eyHJIIVsowKO?=
 =?us-ascii?Q?NaifEBrWeQGRcAVeVq/nLKyV22FQYIt26t8NLTnTrv1RhNsP67G8Mhl04Bit?=
 =?us-ascii?Q?4Du4+DpfosGwOiVmy/c6Cq82xAOUQLrqzmi3JKetlcKEXnvR/kOkUGfO7/gP?=
 =?us-ascii?Q?XgaRH2ssaSNYi4B1qqW2k79/WN3Q0Tg+5fJHDyDSkvXruumt4QdXodJNP92n?=
 =?us-ascii?Q?2TC1wiNNap3yFaTb4TG063cxWLhMwQIfCeIv5ZGV22wlRt10rChGeAEaJqpJ?=
 =?us-ascii?Q?tSiA+wcYpmcSMx7xGSFH+Z93HzRNUBPxdsypr/KgjQm1mX8q/47p5BNXfj5j?=
 =?us-ascii?Q?tkDciplYIXduY7pozIpynOuZ81rK4IXxwp97YOaflwt2Zp7Z1Y8WTQ42YhyN?=
 =?us-ascii?Q?Hww3n7LOam/Cccjto94JWOIrmYhxORBv4i6f3opHSywoUMQpqrU1fH87IRvw?=
 =?us-ascii?Q?Vo3Eg3i/KhF1+TH+EG3kWbYP+nhHt+JtnM9xSF4IxK+awsW54+SLLcSQlz59?=
 =?us-ascii?Q?M36CSZM8W6zvunU+3NkS7u9M6bqwQzSRhACDwmLsXktremcTbAWBI/+8p+0x?=
 =?us-ascii?Q?3AMsTFHz1nZQ3vMQdMwZ7pMhU2RlR0lbv0ckWMVXhURo7o2HSCyaOsId7T84?=
 =?us-ascii?Q?U2IVX4d2KXWbYHb5qeKoTGu/7prXri71ePdiBgEe9SeBv3b1vQ134XpEnlx+?=
 =?us-ascii?Q?PEnfabIMNZVvDjP8yUj63JFfHQthJXtQDqJFlE8JmvqzrefCtCBcP3WpWMTh?=
 =?us-ascii?Q?zXJ8h03334ygLr7EyyY+fDv3dMcC5i4Zm8orIi1Xgo5P8S/QRirFnXd0rnJd?=
 =?us-ascii?Q?X+8YMU4Wf91KocM/uc3XOIQo7wOVUZ3P9WWf+fdqSVkaFWRuJ1r4emdckXkb?=
 =?us-ascii?Q?+YrneUYgaAuK+YVEHEYF6CgaNJHA3YU+uGe8DHVnWcshBsIUe4nV9yD/RDeU?=
 =?us-ascii?Q?xgh+sbZW4l/N81VnMVnWtrkvtGgXfIP6vPBSlsrk0rqT1ZsoTCs6OCkR1yaf?=
 =?us-ascii?Q?AxPVNQtI5BwWV/G5gdjzSKTQI1f42GIgVND91x5/JHT2QFXC92603ajQwHzm?=
 =?us-ascii?Q?QFoCs1Z32wj9ZG4wuOI3voGPu8BKo0laJ3HjvCo88qpMhsrqntA9lBmaWEH7?=
 =?us-ascii?Q?+dHHuytriUJlLtJyeGAE7bfvfCZsYxIFlv16GtK/uCLl0uqmcuV746P7tPU5?=
 =?us-ascii?Q?UWJ+UXVn7/5/FwwEuWRrqFzMyPbC4+uAsGwFerjB5wOGDYVET0yVfmPrT2f7?=
 =?us-ascii?Q?yYuCW2TfadmoSOSDsV5GHMTT9Ihzq9B2PfNR7Bm1qDoCEhK3NEzOkIrFjpFx?=
 =?us-ascii?Q?rIaoHfJ5Fy5HXsiFyGE/rvhaYtJAdAgMJCYRC1iXrUvpp3Mmed89YHVPLCKS?=
 =?us-ascii?Q?j+Pwa9M+Z3ELrFRa89CypchWPMXf8ULF43S7TnPeb+OX+gR94Ydw406Cs9V6?=
 =?us-ascii?Q?zcz/CYs/0k/x5vkC6jtoyiedz/k9cvo=3D?=
X-Exchange-RoutingPolicyChecked: L5DCV/DiUFoWsIy6e3gMYBpOjO70VedbS9HeP+z+hfC6uwV9WZXdMfuNCo5qH6d3YfOE9KHFNavWJWSzIu7NmD5KjNr9NTS1t5+2RF2xthge8M5D4Loo1rmXfKwxsO17FSYXLIx/zJeZyJ88uIAsg8WwXMQ12PwB1uiwZka8sLTXRoGGZNpGp9HAqzLDLSH7yyDQmCns1EVZry1mxc/qKM6A1On/3ng+YTTgDvPWOD6hi44R+hE0xfW4qa7AUTFEEfSeThAnywDngdMfjGtJvuUdO291cerFaJvqJkzXZIEvm9xZJdnxc1RTs4Wws5ciPhyxKcI6HkS3mrUvDoBdnQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oensl3tIL/k+vNLVZsfLkaYhsoUZlyX9Tq6fHKTX7qOZYytgSGBcVal/2Pfn0lpNQHDnGT5HHwxWGLMnEbZ1HMNs6pHHSDP1bRfpSoqM1R5gJMMQjlkTW0ofsIcBVoBGxc6hWAT7JfWp/0MmTzu91iECjGppM2Bh3Zl8IkYpLCDQjwPBwKy7iXz0rloeF5K183X5OgElf9u+Hp4Esj7r97e/WNl3ol1i/AQnnjyAnMEs4qtyK8D/ae9Tr1CvO5jBvpw1Y5CH3LK/6oEOJb+bDIWmigDTdbrA2VCflKTyNSUrYtJdB1EvlQFIfrsxWBcezCVxuPlHu+LJHRmCvs7tv7WBbd9BHsSw9B0CWkv0eQ626l8XgD9kIgo8NnZbQZI88kZk6RjCRXUbp1tCJnvvt/7Y24BkEkdu5d3dtho5OBw/S4VzmNYUHQarKTh9eqFlAX3OPzmGldsJ97Pt47Ec2tVOqgIw6jnfFD30SPQ7wRg9EOSPmuKao2znp608n9UKa5nSzLHTdwtVSqul5IAjRCiK73LPhkqpjTZoPqoq7hfBKpGfNWyFt/NwzOazOwOoPb16v6nXu8NVvHPJ3ANU7k/Nf2iLa0Px/2I7FM6gCcY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d69dd83-91ad-4da2-b9d6-08df43bb0efa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:24:40.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTd0Irozn2IpXevWk0vrgTnjBS274wjauJHeWCKHfxh10tciPHQKt76RPtNqoD+SiepREH13tBT+MUSxDVS/fcr4VengR4HaynXbdE88enE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611160033
X-Proofpoint-GUID: Oy45Q4o0uTwBHEoXLJegFYQYxPQ1pvQp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMyBTYWx0ZWRfXzWzqsEgoYDsb
 JpZZkB5fr/8PJCP7Uyk0dVlYHZb32VquMuFL82PVcbRrKUPgedjAZMkB67OFtLWGdQsxQHuxKFV
 bK89vhXjz7eAxOoZfVNIWihYPcXBXzQ9EAt3sTW2uM0KFzZqROFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMyBTYWx0ZWRfX55iqyMYM6jM5
 bANjE7VPG5vhNBZOx4KdgRcc+mT7PUk5UBja99IIiIGA2LZufr9/i8Ol37yRR7cL2Mtvhlwv7NR
 LtUQ8gg/PuXfcjSYgFQQCq85auYEbwTYs+SrLVG+FRjgFGCVZXxu6Zi5VehutexsN5mAPZgmJ7/
 piW3CNPFshuwwdSEWzxd2Zt1k6O827Q3a1Yt5PKsO6CnUrxaEwISj/aZIzrxTN2Jk0omvVH9Jk/
 J45EvL4H5WrRnpPVpcoEM6w+1tIfELZTI9T+5fKHEfWQP4nVyfkw5eIWEskjJTnDIrvKWL5i1LJ
 KYR0cpEjEnZL1UBnMQ25KhDofK5cZI0Iltxr4brrLI4hWz0O+BuXZIGyai0P8WH9qOT12rv05qg
 cxgiPcbQC5vDkcyYIQS35r+ZstI74t8KBDwLOXF+4iE9fZMWfI/GirH4RZ6iCWkObPBiYBDeGcj
 wh8TeQsU1QfsNY1Pf5w==
X-Authority-Analysis: v=2.4 cv=W7utxhWk c=1 sm=1 tr=0 ts=6afabdcb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8
 a=vggBfdFIAAAA:8 a=yMhMjlubAAAA:8 a=yPCof4ZbAAAA:8 a=xjBfvZVMSjtnnSOzluoA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Oy45Q4o0uTwBHEoXLJegFYQYxPQ1pvQp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_002520_137744_7226F233 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add smp_cond_load_relaxed_timeout(), which extends
smp_cond_load_relaxed() to allow waiting for a duration.

The interface loops around doing a periodic time-check, waiting for
the condition variable to change. Loop iterations use cpu_poll_relax()
to slow down the busy-wait and these, unless overridden by the
architecture code, amount to a cpu_relax().

There are two ways for the time-check to fail: the timeout case or,
@time_expr_ns returning an invalid value (negative or zero). The second
failure mode allows for clocks attached to the clock-domain of
@cond_expr --  clocks which might cease to operate meaningfully once
some state internal to @cond_expr has changed -- to fail.

Evaluation of @time_expr_ns: in the fastpath we want to keep the
performance close to smp_cond_load_relaxed(). So defer evaluation
of the potentially costly @time_expr_ns to the slowpath.

This also means that there will always be some hardware dependent
duration that has passed in cpu_poll_relax() iterations at the time
of first evaluation. Additionally cpu_poll_relax() is not guaranteed
to return at timeout boundary. In sum, expect timeout overshoot when
we exit due to expiration of the timeout.

The number of spin iterations before time-check, SMP_TIMEOUT_POLL_COUNT
is chosen to be 200 by default. With a cpu_poll_relax() iteration
taking ~20-30 cycles (measured on a variety of x86 platforms), we
expect a time-check every ~4000-6000 cycles.

If a architecture provides a waiting implementation for cpu_poll_relax()
(and signifies that by defining CPU_POLL_RELAX_WAITS) we define
SMP_TIMEOUT_POLL_COUNT to 1.

Lastly, config option ARCH_HAS_CPU_RELAX indicates availability of a
cpu_poll_relax() that is cheaper than polling. Long timeout values
might not make sense for architectures not having ARCH_HAS_CPU_RELAX.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-arch@vger.kernel.org
Tested-by: Haris Okanovic <harisokn@amazon.com>
Tested-by: Sahil Chandna <sahilchandna@linux.microsoft.com>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
Notes:
 - Expose the timeout state in __smp_cond_load_relaxed_timeout().
   We use it later to provide acquire ordering for the timeout case in
   smp_cond_load_acquire_timeout().
 - Associate the kernel-doc comment with the actual barrier, not
   the helper.

 include/asm-generic/barrier.h | 112 ++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index b99cb57dfccc..bafc8eeff132 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -15,6 +15,7 @@
 
 #include <linux/compiler.h>
 #include <linux/kcsan-checks.h>
+#include <vdso/time64.h>
 #include <asm/rwonce.h>
 
 #ifndef nop
@@ -273,6 +274,117 @@ do {									\
 })
 #endif
 
+/*
+ * Number of times we iterate in the loop before doing the time check.
+ */
+#ifndef SMP_TIMEOUT_POLL_COUNT
+#ifdef CPU_POLL_RELAX_WAITS
+#define SMP_TIMEOUT_POLL_COUNT	1 /* Wait mode. No need to poll. */
+#else
+/*
+ * Assume that cpu_poll_relax() provides a small blip in the pipeline.
+ * Combine a reasonable number of cpu_poll_relax() instances before
+ * doing anything substantial like a time-check.
+ * Note that this assumes that the rest of the loop (largely evaluation
+ * of the loop condition is relatively cheap.)
+ */
+#define SMP_TIMEOUT_POLL_COUNT		200
+#endif
+#endif
+
+/*
+ * cpu_poll_relax() stitches up two kinds of primitives: ones that provide
+ * a momentary blip in the pipeline (ex. cpu_relax() on x86), or ones that
+ * support waiting for @ptr value to change, coupled with a precise (or not)
+ * timeout.
+ *
+ * We keep both together because the objective is to minimize expensive
+ * operations while polling on @ptr waiting for it to change. Either
+ * version allows for that.
+ * The arguments (@ptr, @val, @timeout_ns) are only needed for waiting
+ * implementations.
+ *
+ * Note that platforms with a suitable cpu_poll_relax() implementation are
+ * expected to define ARCH_HAS_CPU_RELAX.
+ */
+#ifndef cpu_poll_relax
+#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
+#endif
+
+#ifndef smp_cond_load_relaxed_timeout
+#define __smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
+				      time_expr_ns, timeout_ns,		\
+				      timed_out)			\
+({									\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*(ptr)) VAL;				\
+	u32 __scl_count = 0, __scl_spin = SMP_TIMEOUT_POLL_COUNT;	\
+	u64 __scl_timeout = NSEC_PER_USEC, __scl_time_end = 0;		\
+	s64 __scl_time_now;						\
+									\
+	for (;;) {							\
+		VAL = READ_ONCE(*__PTR);				\
+		if (cond_expr || timed_out)				\
+			break;						\
+		cpu_poll_relax(__PTR, VAL, (u64)__scl_timeout);		\
+		if (++__scl_count < __scl_spin)				\
+			continue;					\
+		__scl_time_now = (s64)(time_expr_ns);			\
+		if (unlikely(__scl_time_end == 0)) {			\
+			__scl_timeout = (timeout_ns);			\
+			__scl_time_end = __scl_time_now + __scl_timeout;\
+		}							\
+		if (__scl_time_now <= 0 ||				\
+		    __scl_time_end <= __scl_time_now) {			\
+			timed_out = true;				\
+			continue;					\
+		}							\
+		__scl_count = 0;					\
+		__scl_timeout = __scl_time_end - __scl_time_now;	\
+	}								\
+	(typeof(*(ptr)))VAL;						\
+})
+
+/**
+ * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
+ * until a timeout expires.
+ * @ptr: pointer to the variable to wait on.
+ * @cond_expr: boolean expression to wait for.
+ * @time_expr_ns: expression that evaluates to monotonic time (in ns) or,
+ *  on failure, returns zero or a negative value.
+ * @timeout_ns: timeout value in ns. A timeout value of zero is treated
+ *  as the minimum wait so we evaluate cond_expr at least once.
+ * Both of the above are expected to be compatible with s64; the signed
+ * value is used to handle the failure case in @time_expr_ns.
+ *
+ * Equivalent to using READ_ONCE() on the condition variable.
+ *
+ * Callers that expect to wait for prolonged durations might want
+ * to take into account the availability of ARCH_HAS_CPU_RELAX.
+ *
+ * Note that @ptr is expected to point to a memory address. Using this
+ * interface with MMIO will be slower (since SMP_TIMEOUT_POLL_COUNT is
+ * tuned for memory) and might also break in interesting architecture
+ * dependent ways.
+ */
+#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
+				      time_expr_ns, timeout_ns)		\
+({									\
+	s64 __scl_timeout_ns = (s64)(timeout_ns);			\
+	__unqual_scalar_typeof(*(ptr)) VAL;				\
+	bool __maybe_unused __scl_timed_out = false;			\
+									\
+	if (unlikely(__scl_timeout_ns < 0))				\
+		VAL = READ_ONCE(*(ptr));				\
+	else								\
+		VAL = __smp_cond_load_relaxed_timeout(ptr, cond_expr,	\
+						      time_expr_ns,	\
+						      __scl_timeout_ns, \
+						      __scl_timed_out); \
+	(typeof(*(ptr)))VAL;						\
+})
+#endif
+
 /*
  * pmem_wmb() ensures that all stores for which the modification
  * are written to persistent storage by preceding instructions have
-- 
2.43.7


