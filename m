Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EC606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MFAtSuP0;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Glwt+X2N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qqs9Uya/enmbcDMYHgKdxoLi0Su3erLcmCl8IrE1rHY=; b=MFAtSuP05+xVROow+6xY/VNWXV
	3UAJC0MIPVZwObK2ZMBHCDOMGd9xxe8x8gUBXZ40ni9X+QtJLTO+SNdGbFg7qHkFQn5zgOOoKnV4b
	jPIKwpBBFi02uIVavJSGPVa58kiVLUevuPEC2n+0klhWeR2Wk0zxTqsoPFeLZ5Hs01g29Dl3mh6Oh
	4n4WWjdgJxQ1hZ6b+3oa0+OsMbI5ArPpk65Y4vmtWh5XQ+H5prwqWqeY9JiC75teMlpQzQBlvclot
	NCX2wF1zpBq/AcgDvA/Wx5jv+51ISPEOcP/6Had9gu7CHWireo3n5XIh7MbNiW/nNtTzZzXNN+gMP
	uGiF9/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTfA-00000007NAu-19Dv;
	Wed, 18 Nov 2026 00:36:36 +0000
Received: from mail-southcentralusazon11011071.outbound.protection.outlook.com ([40.93.194.71] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTf1-00000007N49-16Qi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 00:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgTae9GPMV+1uy7Wf3t/5ltnxhFuYL3roY3v+wiGUtdj8g2FV+z6NlGd7Fa4SbEqTNNoTSHvjISaeVJRrHsfEBIdEv0pzYLzTc4YSqcXU/VAUqqogupISy/125rhCcCZRrPkCmhWwkyI0k7rqAgUlRK+0DaAad5P5cxsrh8+cTNRMUNA+My0xhK/HS5CxcPwqvSn5MDnWd7lYv1xlwznrTkMUSlYJA7OzVpkWh6TMAIJLigEyVDEogrOquSF2i199dMc9VgHLeFwYEHP1W4lg4v2ewezSvCTSqEPYqxwUSo61OowoHMX4ni8lNqRuW1OFD6GTx3YdDADdsVBL7P2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qqs9Uya/enmbcDMYHgKdxoLi0Su3erLcmCl8IrE1rHY=;
 b=iZL+/mNAsErJd/FbwW9p2xkkHKtMSSQbE408n/z50cMfnBH/Ozz96zezw15nLREBDibceVCdxeQ9PnuQ1XkBynCTTx6LHKqBw7VPvMlajfXe4XqzZmVEq9sB7jZAaXrEEMc63PH7vnunH1Jf3g38NNbEWSgLsFODpz8XrDoXomABHxqdsLsQG6r5URwqyF+4fNfZNJURTXoONtYxFqjTjkDWy1vNkFtwvPUWCXqWZ3Fs3mIX6GcjElaMe9PTvd+u9kbVIZS+Hmm3PCFL3kImx+jrnJAH9ZltPpBCW2r4qt7a5Cm3IOdwjtj8UjMSrcJ7TvQPjI42W2W8Lwt5+vCoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qqs9Uya/enmbcDMYHgKdxoLi0Su3erLcmCl8IrE1rHY=;
 b=Glwt+X2N9LeKvlns0d0x795VRYjfXWqSy9DyOACLUkpTdI83PJ9fF7zQjcohDKwCQe80aZ9SKKg8i3ZDev5W9gHVtEQ1Wlah3xGfp7+Zi8co2MwcXkLVJy4jKvkVtfSkkfUwLXqBBS8JgSxcPGCaVPUhx6NpWMoAhVIWyghP7kcyPem5umKG62+19lLMZBHbbfeu0WhzgAJr3E/Sj1HikLLq1Ku+3TiClnIRTQsN3JWvy5uY5MkeNYe9wDB1sRzXjxOXOEp5wS3U2AmPnuPHH0qRVzeDTrvtF+gwTOxvTHGQ3L7fQy70x46UpoFTwrw5s7CyYwUanHJ146kFj224oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA0PPF84D37DD5C.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 00:36:20 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:36:20 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Wed, 18 Nov 2026 09:35:12 +0900
Subject: [PATCH v4 03/12] iommu: Add cookie type for ARM_DMA_USE_IOMMU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-arm32-iommu-dma-cookie-v4-3-0c5561288e22@nvidia.com>
References: <20261118-b4-arm32-iommu-dma-cookie-v4-0-0c5561288e22@nvidia.com>
In-Reply-To: <20261118-b4-arm32-iommu-dma-cookie-v4-0-0c5561288e22@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Krishna Reddy <vdumpa@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TYCP286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA0PPF84D37DD5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a276b3-dce6-4c62-f916-08df450bf73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|23010399003|7416014|22082099003|18002099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261026140227099003|261028144727099003|10067099003|261022105027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 1gEJLQSS2p8KA9aJYFDm3zpmwZV29B78AWFY29yXf6L1xkyLjiuMZGccPA5QkasuqSfDc2YixOULnUDnXJ4mhQoS9EflTE6TktZigDNCRyvapIKc1BDIGZgvGMXwRtCi+eeKa6Zhm3iqT66BXUg9cDCTfLaGsx+Vpd6mkKG/BK+zX/faJDQV8jAA7okFNu3WaVyI8hB/yNICyiu0icTXt0rNGq3Teb6N3QXu/59StfqvV/ImdnIKgvBbgM3mY4qVS8XIPt7idPTc41mBaW7KNRgqFhJI53Ze/T5mFh7daJtPeHOgTpYO3ubQ+WURhY3mifcZgU/EhRlv0GtEYEDMBwPzlBchggXCkUwkD1m9WnoFtJqmXr4+yyV9CGz/MUa7xScNKOlBy9sgnhz0VwSXoEcKi7Qpnl1JHcxB5N5y7/s73hTzXg2wam4JNwh7MqJ/R2wQ2Bo0FltMst8cjkDmMBAVi8JpVtYImOIRSEfjwam0FbiZLIMPnppnAna/jqwIvwO4CDkeMOp3Mf/97roj2cyoXJBazSovouaUinrKkTqsiy1AT2pwfHZOl7suw/cOB1Dj7gXmM4Ptprp/KD17tksMS0aXUZv4e4NRPr1kePOInHagmLq3McxRTwGwfg6thUXJrohjFSjR6cMFYQl8GsNTTxt5Sp92H7+53DyBmoLz1kF5kRir3CPbY6mrVN4eIEcgDfnb97vvstW2qE67sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(7416014)(22082099003)(18002099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NqNkQwUUthTFluTElDbGVyM1hRT1d5ckJPME8yQjVTaVlkTTIwbTZYVmFi?=
 =?utf-8?B?WDBDWVY5V3p3bHBIMjMwRmxkOHh5ZThxWW5JaUd1b29sb1IwVzVoMnJrajg5?=
 =?utf-8?B?eWcyOGFuQXFOQWVkTXZLTW44UUl2WkpQUERjdG4zNWRVaklrejQ5WThITk4z?=
 =?utf-8?B?K3FrQ0hHR04vSDFXWXpISHBySitGeTF0TVloenkveEMwc3UwZmRaZi9DL3dC?=
 =?utf-8?B?bVljYjRXcjg3ejdMalJBa0o4MmpxdFJjRW5vVkcwMnhnQTJoU2t5Q3ZNbHJW?=
 =?utf-8?B?TEl1UGJYVTkvSWdCQ3NZOTdzZ2M5YUQzK29Uc3BkNm5tcWFBd2JONVhLdS9v?=
 =?utf-8?B?VTFOV3g2SXBRdkQxcVhqcVNHN1VaRnpPODdTRVdpOGQzWWh2b0JYUUNTQmh1?=
 =?utf-8?B?dnJ4MENmTE5sMWlEa3R0N0drZFUvVTE5Y00ySHpDczdDbVEzMlI3SnQybmZI?=
 =?utf-8?B?czJnNzVWT2FHRklndGs1RyszaXJDckdyZTBzZnNrVjltU255TzBzWWFjbm10?=
 =?utf-8?B?ZW5xdVFwUHlPZVIwa1lkNUtzcHRpNitGZkk3K3ZwUk1mVXZFZXBFSUhzQmVW?=
 =?utf-8?B?MzZqZWtsSjhnZnRwK3JycmhvZTV1VWJBQWVMV0NqNlNPSXNweG9wU1l3Z3RM?=
 =?utf-8?B?TGRTaUIxbENaSUE0b2ZXbkd0L2c2MmtHemtJNXQxdDJjNGFkczgzWHNmSWdJ?=
 =?utf-8?B?VXJJdDdSWDBJSERSbGxpa2swQ2VGYWEvYnJwQlRydFhDTm1SQmR4R3NWdFdx?=
 =?utf-8?B?enVKSUt1Y3FSYlEzb1Zqc1ZJVkM1YWtybzh6MmFhSGZCYW9VWXorUFRRa2Z3?=
 =?utf-8?B?U2V1cTN0L21BVld4VUtvNENYUjM4WWpObXdONWYraThmOXROR0E0bVJzSzIv?=
 =?utf-8?B?RkFwNkdYRXc4K2ZQK2htOTUxVkQ5cUdqWFpLNEJmT29ZU3hsZXlBaFNiTEEx?=
 =?utf-8?B?a25udGYxbUQxVzlnVHBpVWlkTFNPZzBOeXd6Y3JpWHQybkc4ZE9Nd0hFMmRj?=
 =?utf-8?B?VXBmMGF1cGRlUGhZVXhxOXhhUGlualRGYVdvcTQ2ZnB3eGVTc1FmWi9VZW1I?=
 =?utf-8?B?WUlWYUlyejRFRy9qa1liTi91cS9wemFoMjVUN2w2a2U5cWZMcStOckdjVUJi?=
 =?utf-8?B?VVJGdTRwTHBRVFkwWS9aWVhVUG4wYVBiOW1nTWZ3SUx6anpGVXlPMC9JZUxC?=
 =?utf-8?B?TFNSL2dkSkdOakhMQ2ltQlcyMTBBTDhKdytGcDZzRmRaWnQwSHVXeHpsbVR2?=
 =?utf-8?B?dzJJcGZRYjdWaWtudGN4ZjVZRC81YndSWDZYQnVIeEUxb2FHMUFJMmJoNXFx?=
 =?utf-8?B?MTBPZjNKTHU4Wkgxb3BOZzBhdDRjUW9EOWZjUWM0V0xJTVRUYXFGRnJHbzBu?=
 =?utf-8?B?N0tHTGtoV1JCVk4yT00zVUZqTHFnVlFBbnoxbWprcTRJZUFkS1dNMS9oRzZM?=
 =?utf-8?B?cjc5UEM4eGp3djROZzBPV1Z6Zk1KR2c2bzFzbzZxdW1DNHVsOGM2ajVRSnZU?=
 =?utf-8?B?NDlBZlZYOVdDQnQzMURPNUJ6Tis3dVRwZGl0TyszQlJqWU9rbXc1Zjk5emtU?=
 =?utf-8?B?Z2dPNGJaZThnQ0dmSGtKVGc1cTVDRE1wNjhwS0pkOGVrTW9PTERMeWt0RE9z?=
 =?utf-8?B?Ykh5ajg1SnNLNlZWcGZ6MWpYUVluMnVrekZ2TUJ2aGJzb1lHRURXOXJQZTBV?=
 =?utf-8?B?RlBoeTF3WWxoNkJaSERSc1orSDRISFpXRldNdmIyTGdPSU9ETEJQaHlCV0FK?=
 =?utf-8?B?RmMrNzJEbDd5NWJpZHB5V1Uzb21md2NxWnYrMno5ZUZURHhtMWhIdW9jM0Ry?=
 =?utf-8?B?ZUhuNU5NT1NlUXFYZGNaYnZjR0N1R1ViQ3Z2ZVBIZEFXc09ZdExyMTA3dXgy?=
 =?utf-8?B?M3JjV29ja0JkaUV5NE9OMEIzaFJ1a00ybFlBdUZxZG1WNmhqU1J2TExpSHNQ?=
 =?utf-8?B?WGhqUTJUT0grTHZ4QUpRZnN3Sm1SUkF0ZnhyS1ZvWEFsNGUyNGF2ZmhSU0FJ?=
 =?utf-8?B?SVhVb05ha2drRXhodWpXVjJHdVBrQVk2WlY4KzF5aTNaaWZCRWNPVjJnYlZQ?=
 =?utf-8?B?TnM1dTdWMFdWYnkrZHBVMVYzajBCcXBDSklFQjF5Z281cHZIT3pzQ1VxSUdF?=
 =?utf-8?B?dVUzWmpWMTdDeHR0NWxTODlYK0sxZXR2Q0JjMmVKNlg2V2oyYml0U2p4UGNF?=
 =?utf-8?B?YzRwVlZRaWhJdkpDTjBablRNa0xCbHRleXVGSlNVV3N3bng3aWhDNzNoZm5L?=
 =?utf-8?B?RVBINzUzZEtWbXloSzdnRjltbitnYWh0KzR1Vkhac3h6WktLQTZEaE9jbmE4?=
 =?utf-8?B?QTlWNlV5WG5pWkhyaGZWWVlOMnlBZVF0SzBaaTBDbFA2QTNPVDZ3dUdDMnRD?=
 =?utf-8?Q?khsBsl444lf6g9umhdGxNfb70+v8dGH/ZznpaFWVopiHr?=
X-MS-Exchange-AntiSpam-MessageData-1: XVtX2TuBrx6ZBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a276b3-dce6-4c62-f916-08df450bf73b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:36:20.5862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EiK0lzLMRASoHI1wOlbwKGI+LOnC6tbj7p4lA3h3uMOqFYeB1jXrXBtm8JIIFDlkoALkhIsORO42peGSrYG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF84D37DD5C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_163627_326651_B3C6B8E4 
X-CRM114-Status: GOOD (  12.64  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ARM_DMA_USE_IOMMU DMA API implementation keeps its state in a struct
dma_iommu_mapping. Currently that struct owns an IOMMU domain -- to
allow inverting that relation, add a cookie type pointing to a struct
dma_iommu_mapping, more in line with how other architectures work.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/iommu/iommu.c | 1 +
 include/linux/iommu.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f13b1c38eb44..31c5e336dac7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2130,6 +2130,7 @@ void iommu_domain_free(struct iommu_domain *domain)
 {
 	switch (domain->cookie_type) {
 	case IOMMU_COOKIE_DMA_IOVA:
+	case IOMMU_COOKIE_ARM_DMA:
 		iommu_put_dma_cookie(domain);
 		break;
 	case IOMMU_COOKIE_DMA_MSI:
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a36..34fa5e050608 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -43,6 +43,7 @@ struct notifier_block;
 struct iommu_sva;
 struct iommu_dma_cookie;
 struct iommu_dma_msi_cookie;
+struct dma_iommu_mapping;
 struct iommu_fault_param;
 struct iommufd_ctx;
 struct iommufd_viommu;
@@ -174,6 +175,7 @@ enum iommu_domain_cookie_type {
 	IOMMU_COOKIE_FAULT_HANDLER,
 	IOMMU_COOKIE_SVA,
 	IOMMU_COOKIE_IOMMUFD,
+	IOMMU_COOKIE_ARM_DMA,
 };
 
 /* Domain feature flags */
@@ -234,6 +236,7 @@ struct iommu_domain {
 	union { /* cookie */
 		struct iommu_dma_cookie *iova_cookie;
 		struct iommu_dma_msi_cookie *msi_cookie;
+		struct dma_iommu_mapping *arm_cookie;
 		struct iommufd_hw_pagetable *iommufd_hwpt;
 		struct {
 			iommu_fault_handler_t handler;

-- 
2.56.1


