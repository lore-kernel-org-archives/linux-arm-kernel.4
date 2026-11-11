Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CwZMZdSF;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=riL8eLjO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sSun++khcitBgLTyrYhD82e0SinqpKhi6fNfrquyj/M=; b=CwZMZdSF4tKFUk
	di+ZBz8CTxnbN2fm+lRxvMON2L2OYzFuuql/xfhdxnaKD3Fuh7wyDVNaaskmx44wL3iIz2YgNSAfC
	2jZU1uB5Os4ZorV1x5eNfNQIY8D66b63YltiapZhzDFLnQWXuRgcbb2+MDjR8kUxqDpy1wqkA68VU
	2vhsoWw3rP+Y06hWlPO1l2SYjPK4LxHjPc2eDdzTEOn3oRw1UIwJePxDWl1HOW7sR2v5mkLlon12Q
	7KG8Rx52kM4jYFydUf/aamCudrRRlAmqzpRFEs+40pSObtchG/StajVWh7mweyx6GhEpyxII0UQ2Q
	zoLkSpfydujfLGwq37cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBqP-00000007Gvk-3eQv;
	Wed, 11 Nov 2026 17:10:45 +0000
Received: from mail-westus3azolkn190110003.outbound.protection.outlook.com ([2a01:111:f403:d116::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBqM-00000007GvR-0qCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGXX+WgZ5ZXSp2pzsZk7M6K+sfxUGFl8uKiMQolT1wgg4P7ayAbgchdEVLql1pSjdd+WGGCMTqfhQ1Yd0Ifnb3/esg+shj1gIw95gPzIGf6lS2jvJhaiIYXVKtYSv31zjgR8eQRYeXV9geAc7PcrEf2cJI0yPXBa5HuIH+RLzVaonhBb4Khzg1Zio4HRqeucy9WzxVjMbZdSpjgw8whJ/XwSz+F3qXxQFH7A0o53MYm1/fEzQVQ1+jSibZNZQgRmF2wfk+9i1GyLkLLdLteKw1Ie9qCyscXybMNjJx9xPNpV3W0Dh/TndL7CbKukCkh170TsO5Pp3kr08qPvRcMfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSun++khcitBgLTyrYhD82e0SinqpKhi6fNfrquyj/M=;
 b=fBiaTylveJmnyi0U6OAzKLGcD7AvTkvXrX11Qadll4kQWMnam7NlN0liOMRgPbSUG3c8RqB230GrI5Nsxzq3uZOD8FSTibCaraI9Lt8284lwuBVnt4kkNmf0zY0cReG5PpOG3IHHgRHDrCDaHJf0BO1JJFXMZZPld7r7s+XeNEU5aXiStBeu/y7DyNTzGRfEwCpx7kxzfv60Cl3FO6rF2wPIabPHoluocXoCwvBwuozpemNtUX5wmlAlkNfXIyNehIGBTNDdM5IjTFwjUvvPZFEqV2213NotoA7xQDgGM6A4rY0ZECzizf7mC5doWgOg1fqUNPbiM9urSlNMSBjoZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSun++khcitBgLTyrYhD82e0SinqpKhi6fNfrquyj/M=;
 b=riL8eLjOz6YYsHuUq/fRKN8okQNHa7dKuJ/lFmx+LfINrIT+RRFNT9McteD389M/DB3IxZPiuMKSVN17+5CDVAQzt9h3mo9LkfbcnqBgdUgKrok8EFm8NhU7KIN1b1fXs/vkq2dz6YK/l555Lwu0ChBr7Yh7czvvpUBEi/l5HUoCAuc/nFYLJ2c/iBnRLBzrRut3oF/nittL82QcRnhuNPT6ptLuJm011qOuPK/oT2xbsJmKLYKvJcWhu5yI8TNfuatNGRIh2xNfN6t/Kaqd+YUjkmrQoiU78x3LrtnmQ2iCQ/liZvdKoibAjiisJH59EkXR0Sv/BxZ6qnonlEkTuw==
Received: from MW2PR12MB2523.namprd12.prod.outlook.com (2603:10b6:907:11::22)
 by SJ5PPF4C62B9E70.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::991) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 17:10:32 +0000
Received: from MW2PR12MB2523.namprd12.prod.outlook.com
 ([fe80::336b:c57a:e118:4352]) by MW2PR12MB2523.namprd12.prod.outlook.com
 ([fe80::336b:c57a:e118:4352%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:10:31 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: cwweng.linux@gmail.com
Cc: andy@kernel.org,
	conor+dt@kernel.org,
	cwweng@nuvoton.com,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Wed, 11 Nov 2026 11:10:21 -0600
Message-ID: <MW2PR12MB2523830C45E9E902A40D25EAA5712@MW2PR12MB2523.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104091136.151269-3-cwweng.linux@gmail.com>
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR19CA0009.namprd19.prod.outlook.com
 (2603:10b6:610:4d::19) To MW2PR12MB2523.namprd12.prod.outlook.com
 (2603:10b6:907:11::22)
X-Microsoft-Original-Message-ID: <20261111171021.35780-1-chernyakin.victor.j@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PR12MB2523:EE_|SJ5PPF4C62B9E70:EE_
X-MS-Office365-Filtering-Correlation-Id: 259f0aa8-07bf-4fa6-b229-08df4016b099
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799012|23021999003|22091999003|24121999003|24071999003|24021099003|39105399006|20031999006|2604032031799003|12121999013|19110799012|8060799015|260925184616899003|25010399006|4140399003|440099028|3412199025|41105399003|40105399003|26121999007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pJtAEZocY7/NCrwyONLC0mX3MczzmGpnuZ8ZCJnROvMW0TuDaTPbVtkJNemi?=
 =?us-ascii?Q?hPbQVmxCdVxLWjZWzGqUiB7wO+HrSRfCbZDjmCJv+JKch+V+l2f+ci5XVwXl?=
 =?us-ascii?Q?dKvvOvJFYlfVVdTFp4K/34v94HALHXtQA+OESyj6NsgE3lpFA68naXc41t/0?=
 =?us-ascii?Q?ij/2ojZ/rzGYMdcy3gwRl28Iwtqkm62CUjYAaAHuqfl9sPu2oPK2gJ4yJbHg?=
 =?us-ascii?Q?7V5jClLMIHz8ekJt39zI1MxRA4EYmqcPwK2AhrfEhZGd3qdvclFeyURWQzAr?=
 =?us-ascii?Q?rEZ7LyEwLByqtb8uv6f8A9ox7zRGIhOH0NONGeu7nDbvsFcqN475SH0EeCXe?=
 =?us-ascii?Q?8MTB0iKOEvKJQ3IpH/+iPE4kUEB4a1FEY/62OetRCeYdNeXFy54cCwwN0Xs6?=
 =?us-ascii?Q?eSaaZmSWl6SpnwrFkjqTMs90UxL8oDzjY89zH8Nmp1hZb/GdgyjmFkrQe4ul?=
 =?us-ascii?Q?8V7D9Z1fdsPrEuEuuEvueeQsPIxn0VurkS3umU/d1drmATwLLbA/231IpqjW?=
 =?us-ascii?Q?bm7d5MCx+Kg6XfHzIfGhJgEf/z562QtyVRUDx+EuN47/VFAQgofmdwPvIcX0?=
 =?us-ascii?Q?P2lJAbTdRm5Ql/RW0/+6sQ4e/RP3BqMkH2Pcdvcju6JGl/2nt5SwwF08Nzg3?=
 =?us-ascii?Q?TmEnw60YmZpXV0f//lKfVqRvOnI+Ys0jBasIz8CP+zkzQLMzSYnAdpZVZRRc?=
 =?us-ascii?Q?sBppXmtZU0Q+Qhk4j5Q02X27YSZYzwDgiGeZA2dl4J/oVVBeZo5Y7TqnlVR+?=
 =?us-ascii?Q?WBk7+HXfySf7M7NGiWTT3NgGBGkRiI1qtEHT/a9jNB2MRRCW9diWcaLbt3a1?=
 =?us-ascii?Q?K+QSim812aKRxOYkQukVTYTuc2Shdqt5bIStjcksk4RGKgD5V+Cn/IyJyYgQ?=
 =?us-ascii?Q?LMMmaGhHoB3Zfg+RrsiI27rjLJedbRODunpNl3qYgiPwL2aOp1KF4G6s7z1P?=
 =?us-ascii?Q?f9fmMIt3ndp7R1Xdg5hCml3YO6Xiqj8ZOK9+d7XwxN3sut6/4KF/EylzTuOQ?=
 =?us-ascii?Q?WQ6kUYevoTDxlhCfF6Dxg/pt8EJZfeGOOrzKmybPHYWIb7TX4A8nseR2xMG4?=
 =?us-ascii?Q?G6+tPL+qi+U9+COkMNS1dcbVLwWZVwx3U7ZHGv+STDIsAS0zia+5u2Ku9YCg?=
 =?us-ascii?Q?flywpIdJdq2hCgl4MrHlfcrrNH2nsd/+FIC9QI1/Lnr1AQCkaRNpM2bOFpDr?=
 =?us-ascii?Q?SvaeqwdvMtcoM9Wh0ZDcgWSHtSi/B2MYLL1RtA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+V66pSWXs4yVNKUyj2JJcWPDALI4cPvyYX5K4GevYPceZEP4PknbmVpmIwZq?=
 =?us-ascii?Q?SNBWcrD4a3jM7QbfW6tFj/oQGsAjD4Khj0iqrNF/TgrG/5fEWKMmwcYI0NkK?=
 =?us-ascii?Q?AyNlN1oNXpa81Ajj2zHanbx+oZ6KiH6rtqf8gi0zSJPgMh1+7BcOYgLv3iJL?=
 =?us-ascii?Q?6b9oswxnT/ZX5wDk0y5oqrei8iuFJUnkQz87zsQ8OZNEO2sM+XDS3JvOjrgM?=
 =?us-ascii?Q?wbqR6NOu2g/N20JyCUlFPtYK4jSv1z23/w4fi0nWad0ixFMXJNpbQio2JQ7+?=
 =?us-ascii?Q?YIeJRfXTQb/W1hnOfsfkFE/XIZ4qnfu0MTQqS/QuXzWGyUZ/JThqkfcwjCT9?=
 =?us-ascii?Q?9p8haeFyTNZmzPqEBgy0wprEyC5T29PEEjDSWCVSJjeCSZwraxCvy9KtjmXm?=
 =?us-ascii?Q?cMsyZUu/ffMRgZ/pax27bhXvNtWE1XRr7UMAh5iUsagcw6RMo1G5sq+c0kgs?=
 =?us-ascii?Q?Kbd0i7nqkTuhAntvmiDmUg8dX2cdnUWSY0OHUVsBylZdhVdycwSCgZ9noUQl?=
 =?us-ascii?Q?JA2epFnhjzLMB9vRo/5Dw/fQo6c/RZbVGg29cDJumpkRBFfefR61Ff5vgnpV?=
 =?us-ascii?Q?hKdtlK4i1q6gvQTYfPgaOT039GdyIvDr4ZVuTru08if13PJ3MXHVcQ6nYB5T?=
 =?us-ascii?Q?aZYHMWU95jOuXmGpsmZHasi3y+x/ql/7Z5womG3KFH+HFEY2yuMZPzP7hEI7?=
 =?us-ascii?Q?hzm0HpS3+VXrHsy8mj7+yi5SDi9D9iFQr3AwXS0PIjL6E22GFtHZTHMudLON?=
 =?us-ascii?Q?0c05w1z6QXwnc4b7rNtHV1GS8RA/PyPWgqW3rsiWeooDPUulUhwUG78y7NaH?=
 =?us-ascii?Q?Disd44iCdZeMGBoR35si+HBitw7RI3Pf3SIakTQMZctkSzGcaQtHy9d6KiOg?=
 =?us-ascii?Q?nbWNYj/yfdGPXWRP34Rgom917Be2GRGE/7WpF0GmuELPPVsrKDoqZsWOJDqQ?=
 =?us-ascii?Q?EzxbCqAGusAqi8MBcsJk3myBflTjS/uXWNE2hsZjOFuHPSMi/LtM0J5yriJF?=
 =?us-ascii?Q?rFzaPCOVI7EVjT1gWtl5TYeaQawVjNM5Uehbm09ju0MRVdxS9JeiLRgSSQUd?=
 =?us-ascii?Q?P7fqXmAWi8TRjJEQJkGr+VdZwQHfOyD+UEGnYhfYqbD0hOCm3DDdmMhbmZ6p?=
 =?us-ascii?Q?s2LhVElekXfhiymiKApPf480OZJ9z6v/IEVbzLpbjIANOfW6Z/1xn1a7Dr2J?=
 =?us-ascii?Q?mfk4l+jkr1NIdbG6TG50aQDLfScuExZs7zm3j30uQIVLCduG5FUI0bMDMHTn?=
 =?us-ascii?Q?E1365b/3pJDjnXYleJyuG16kxEODSnJxbZuSrYlubhhXdnBQvYF6rNxN+jM6?=
 =?us-ascii?Q?dZPZGawm7c0Ii2913a3JyjQhkX+nV9+aHIs7cGRhY4GG1doStJfFD96AnW4C?=
 =?us-ascii?Q?4blwmuPLfABGy0/IQop/YgrjUCmsJdjOgCwlsaNArJ8GP+eUWw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259f0aa8-07bf-4fa6-b229-08df4016b099
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2523.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:10:31.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4C62B9E70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_091042_415787_85C8082B 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
> +				     struct device *dev)
> +{
> +	DECLARE_BITMAP(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS);
> +	DECLARE_BITMAP(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS);
> +	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
> +	struct iio_chan_spec *channels;
> +	unsigned int scan_index;
> +	int num_channels;
> +	int ret;
> +
> +	bitmap_zero(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS);
> +	bitmap_zero(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS);
> +	bitmap_zero(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);

The bitmaps can be initialized directly:

DECLARE_BITMAP(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS) = { };
DECLARE_BITMAP(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS) = { };
DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS) = { };

There are several drivers in IIO that do it this way, you can check by
grepping for DECLARE_BITMAP.

