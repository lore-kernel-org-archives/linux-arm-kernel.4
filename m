Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QiDHNK8Z;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jVuDFlap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=; b=QiDHNK8Zm4PS8SpcYbkg57Ak11
	xhNqsudn/wX5wiXuCptq6s6/qrK+Xf62FAsSdgwE2/XqdmpuRu3ETsQwRTqPvDWHXgU3utxG1OOSy
	Wn22GyMxAMRIdnbQjTKNLHsY3aJj3etPX57Dk4gUK1rD/zSJz2Fjg/4MSmMpQF8fG8jdBRZLbvm1f
	lXSUP4oWbjTjNBQlYeCbmnx6Eu/DjKB5v/qXyzUtw4/J77PMASXI86PHFLO7WrhYxI9TiWZvKo01m
	ZwPD8X7Mx2dQMhkZ+oyFUm75Rw7wIXYeeSC+6UQZ+sIt4x26O63wdR951nf7GGbn+zVHtU9kOnWts
	XfdoK2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbMS-00000004wZv-4B51;
	Mon, 23 Nov 2026 21:14:05 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbLu-00000004wUv-2trm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 21:13:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3kLOdV9DdmGaEr82Nx8V1Be6AzRmoKH/hYyxaeTKFVHsvtnQmmzTSvKf/ElmbKK47ndxilC5qM2z12ojrE+KBFO0W0DehUBGJhSS4NAKnjOpjNAuBUyI+zozuQzfdxIbBjEsdl7pr9mvWdPwI6P93rj+HxlrYMDjxIsFwyoW5ELVXW3dR+ynevEphB4kMvX/B4Z4hEtLb9Ua9Nb/FUfeZkB7rMJln6i4I/XNAH3HpYDD5nSffrNzI2E4UztBbJxpH7UkFQlZQqabQYVI7V5oxCkh5fzk074SFoRRNmGIAxdRdYGs++M/OdT+hgC3MFiWYmqSr8+KH3t6KvtmXWGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=;
 b=kbuzx2jPAtu2vrQ6whq2xdpbfIjyytVXt/+2cPvsKM4bc9sj5Gl8m/hfmuCEgUrKbsIRVYbpsOGMB//wksLR8VSnLjIx+hJyGPH63+wxHMN74GSTlokaU5zZ5Pr1TD5HiIl+Y5sdYk9rhfdsTnl63STExXAEIBB6GpniOaMhWCtJVC3V5S3V9keMwyJlu+J00guTKgukBkH6El+fjxOB2n3L/F9RM2DStjrgDYvP5vEgPieCfFllqLnIR4G7lme9+nhpqYmFYA1zDVZqxszWRSP+dJ4Ki0YFGQQ40khAf8nqlPAJaksVwmCWP2HRKwWTXtl4FpJEqIWSfd69d0bDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=;
 b=jVuDFlapXE2+bzzArGLvX8gZqi+uUBDOT0B+tn3rmBwQ9FlyS+VwHEBu9nWJDpB1IxQt2ihHV2hpSxpn+7YjZ/csMunCI9Ioy2fGnUygPTWuTFt+KSprXujVPJfjH/dRKX6IxphEK9AZq58AAJEJx7H1C3D5Rg3sIAK4H/zurWrvo1VrFHkO1xS6lCSVVDhVI9qJAMGRvwRpGO901fQSpv/FJCSxfRldmevgpiRXkGO1wk9hS2P8eIa7pdfGY7sE+ENu1M3hLSeath1A2kcveUru711kA231HAic4KEs7+AsXsUczFpsMozSyUsiCPN04AnILHvDQQOMDIg3nBNt2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10364.eurprd04.prod.outlook.com (2603:10a6:10:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:13:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:13:23 +0000
Date: Mon, 23 Nov 2026 16:13:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
	"jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <awSsaTb57yK58Gyf@lizhi-Precision-Tower-5810>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <av9XG97eKQ1gZCFb@SMW015318>
 <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b694be3-c408-49e7-d82e-08df49a69bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|261102123227099003|261028144727099003|261022075727099003|261026140227099003|261022105027099003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: +J/diUWKMHZx/f6pF3qcpQJE/4E7T3/hBnt7W7h1tWjBTM9Q/xMG7DkBvNhwEXgbcTccRnvG648Ay+mui2ynclYDr/rwcGnJCSsV+b0M19XzBo/1JfMODriKz77UZ5VmWQ82gdX4U5sqac03eVBe0KJgsslpVpwYeK49bvtS8LyZ0jq1hr4h3wGAB7GxSayChaTE6YpT+T0SvYxmvIt2gpx/axc5iR+uUGAwdv7Jb3CKj5mE9eNrIfcFvv08V2VXTG1x0NTZOfOdmWpvihGxV62k/OCQvXAJwqNg0AeUvAehw18sTZ2ZpcE7Gibn6XhDpGnyjrrQ8C80bUAhC3qkGtXMA0FzLYdJ8HOXkpf5YTohiTMgO4V0hT9454BEqarl0OVohxxwmjAbeag1F/ZTOImdbOduC5TZRFCvZXIoyqOZdziYpdZNMlZC+Ndd/pYkSTA2K6d947nXvCsHZUmVamEknT/pIUbLZe1n+SCwxvQaeaa/daElDORFoHThaKtgTHyiu/GOVsExJdktMZCiItb3R8mPHntF6VvLAh0dKza5YBYdrhpivMRT2JIPKa8O3pKjVRhkON774ks0qhsuw0TQdf/01vMduNP0Zk/bkEYsaTyhuVniqFDMIlhOCx4J7wq52w3Rqo1vz02anzAYQ608qtDB1wzijovCbVzaV0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zFFK1lE5NE3yp7ga2e6Ov6AqEhZMUORBHDQg3dDZXmZ1kl5lMqlG6H8bqyGG?=
 =?us-ascii?Q?+6ucAMClw04UHP4JuRIjwtnVf8Xv1xhYuzWdYfdtB2kVCv2Lk28mhPV5JhuA?=
 =?us-ascii?Q?hNDiYcMqsxCahrQ6gjbBm3p5ZbogfWqo4215CQYMft/5DW6bzUAOrdsGPdtA?=
 =?us-ascii?Q?oXF/9AWLNFGwqeV1orPTWK0EJZRnkfhVef3x2f9XZOiyv4KeOpozgL72xBZO?=
 =?us-ascii?Q?bj6oMq4Vu4YZ4JWrsPExlRixLdQXl31AyfjZIgs61fCjrBDW7lgD31MSjS6p?=
 =?us-ascii?Q?JkU6RahGrdT4tr1Usn+DFQT0be/pRVr0g0X3EVo7faRdI8J+Byg3WgZrdwH3?=
 =?us-ascii?Q?6sCtlJCoPW5jV3EqAy/eDTYguOKM7fnD87doXxRCFhgVQT3+0qz+4VVJEo2M?=
 =?us-ascii?Q?fvjXOdGhDPFt3xWEWvEdNw8mlvw+tUHjt4WQU12sQuilLIreqmKxAiKJLs6H?=
 =?us-ascii?Q?URWg5cbL8GKfG9DnoAhC1D5xGwL2UoSd1301OU31+HQKDmsOM6VRm63qit94?=
 =?us-ascii?Q?ftpIX2o4X9WV4CAJV698nMDk1wyI7aiDQb3xVtIUdJCwEyKAE4k2QUdw3111?=
 =?us-ascii?Q?vxtlf/090Gn2lCzoA+0YXq7O8RKtwiohIWL+7bt5ZeLTmUH9HbKyw5i5R3dB?=
 =?us-ascii?Q?lNz1GvRwTCSIxMjeFnlAZ+0pKbvAWtnu8pet0OHaZL2yPKBzAXgANfoNeOwL?=
 =?us-ascii?Q?FUIOzVs3iM0l1OcTQLv40IiEebTes/qW38J9GR+P3+zuflNFAZOwFO6xl6eB?=
 =?us-ascii?Q?Okm3QIkRSKAJZWf7blMj7+OqvcBfbLoftkHNQ9jafz+uZfFTIoKFT3YYV4pq?=
 =?us-ascii?Q?FRWkfBUFNKvaL+X+SpBJDh3uPjo0BBn6plvDvK99j58wZ5SSV9P2M0MT45CG?=
 =?us-ascii?Q?eUn2gyhIAss3JwL+OU2i/DkeLFPn+HBMSV7sCefqrsFSLt4Su33dcxCZeCKC?=
 =?us-ascii?Q?1xKfV2Xk55tGOeFyGzKazowIhsd0u5RCa+HT/eHXGVS86HRu8lNWD9jP69AJ?=
 =?us-ascii?Q?Mu7ukhW+9bBdz5qRPzeveAV78MJNw6R1YB+oGVH3N40kDF5T5KBcCa8EfBRI?=
 =?us-ascii?Q?BhJ1ivxXLfuVnyIQU7cp1/dgvZTQKOlfbmiU0hh+SEkI46YiJho4mOMwEInv?=
 =?us-ascii?Q?eSmo/SyfgNKOssfwQVRhsXQRoIDDaT4OASIexxFlQVP6MQZ4WiIzIual4Sc8?=
 =?us-ascii?Q?dbKlpWtvKvdRwrXXrbfdvOCDKgyo7xw3uhsL0OSMJ1NPdNy9Y/gCYBehE67u?=
 =?us-ascii?Q?5s4PRhy/SyUn3+TefiHeIrFBHlrsAWFf8o3lUG0DMMww3s6nP7Fp6kWrapLE?=
 =?us-ascii?Q?zBOnOd3QJzS4lOgrYTnoJXXl76mifCIh9VmKuYgI144isOPqf59Ku2MX/MjB?=
 =?us-ascii?Q?fiOcK1Z5oJw2mNbGZFGgVeyFDMCl/CpCiPrQaCZqTfIp+HtuzgZl2CntObAF?=
 =?us-ascii?Q?UMCQZgVoC+CPY00n/lbmPtUP/VF1kVnPvC/8CkMdQAeIdDktPFxIMSHnfdnk?=
 =?us-ascii?Q?eX09XGqGRUePsS6NiVkH6JBI4rGSA6uz81gKBQlycrtuZ80cax/nvDhACryG?=
 =?us-ascii?Q?JpRolyexp/lZXwq58KTbEJbkdBh4e41cePantL5sWl+6QYzdVmZz2q5FHptY?=
 =?us-ascii?Q?bq8xW/63BWq7eeMoz7tXL548+D2HCbQu4Ux5pP93OPJPwuQFvquVL/7O4nTg?=
 =?us-ascii?Q?fcZ6nXGGAJz8dSlAa0R84wr+5wSRQr+h5Rwy0x9K9VSdvRepQrMiv2SKWij/?=
 =?us-ascii?Q?SJaRWhQVVDUb+Ot7SEqrC1V76q5mdQqoBjPoBrNMqEf2KX9Bg9pX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b694be3-c408-49e7-d82e-08df49a69bc4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:13:23.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRBtLTIxgvMndQYz/rVBkBBvVWGallsineGkEQoB1IXSMd8Bk698CxeC5W4iCZUQDWS7MY8EIG79Wfbf4aSliMMO5WSAjKQZ5y7OXxWaPXknb63pbDANq3ftWdNQqseg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_131331_418000_7079A3ED 
X-CRM114-Status: GOOD (  14.45  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 08:58:07AM +0000, Nas Chung wrote:
> Hi, Frank.
>
> >-----Original Message-----
> >From: Frank Li <Frank.li@oss.nxp.com>
> >Sent: Friday, November 20, 2026 5:08 AM
> >To: Nas Chung <nas.chung@chipsnmedia.com>
> >Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
> >krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> >imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> >festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
> >ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
> ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
> >Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
> >driver
> >
> >On Thu, Nov 19, 2026 at 05:59:56PM +0900, Nas Chung wrote:
> >> Add the control driver for the Chips&Media Wave6 video codec IP.
> >>
> >> The hardware contains one control register region and four interface
> >> register regions for a shared video processing engine.
> >>
> >> This driver handles the control region and manages shared resources such
> >> as firmware loading, firmware memory allocation, and coordination
> >required
> >> by the interface register regions.
> >>
> >> It also instantiates and coordinates with the `wave6-core` child devices
> >> for firmware and power state management.
> >>
> >> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> >> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> >> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> >> ---
> >...
> >> +
> >> +static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_buf
> >*vb)
> >> +{
> >> +	void *vaddr;
> >> +	dma_addr_t daddr;
> >
> >Nit try keep revise christmas order, check others
> >
> >dma_addr_t daddr;
> >void *vaddr;
>
> OK, I'll fix it across the driver.

Needn't reply argee part, only reply what need discuss part to reduce mail
list loading.

Frank

