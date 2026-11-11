Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD07606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YW/+ystk;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=t04v5gUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PQrXxJ1/ywpu0AZjyo32Go5eqEwExS2ugX3bLOHHimM=; b=YW/+ystkk4Z0ytplqMUa1VxJGF
	CcPP4PpUt4kgSa3nsEE8xsqi+vXqF9l8RO10Ov8TN0j4dR9r+W+ke0qRWWd09cgWQwJv5yhnQFNKw
	1AkyeHsbDuFBOjheXy2RSjeszevIPo5Ia/CAHO/STCfeQzwmValoOHTM1HJ8HUgenkDCwb7bX2rfX
	I3rr3NoAGytbhqnRXAG3I5LFjHReCA/xm1CAbjrk6p7heWHXSrHHiJGjn8fKUCV/MlKmrz6vK8v9D
	+2C5KzLzVZ6awB9l6AjmkAGn6Xt5PkfmwBjbXDnRmOCundbRVrJHjztD0RepbasnCon/QUpR3ObzF
	PJuU59iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCdO-00000007MaC-1MjO;
	Wed, 11 Nov 2026 18:01:22 +0000
Received: from mail-northcentralusazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d111::2] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCdM-00000007MYE-24Om
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:01:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fD9XZ69rl4Lqi3EwH8cZL6l5Vl6jAZOH4xlRWvgqiHLOnDOvrx6gBFTmatPBtqUvibhliSOV1BZ2j2XZOoSBGF47JWZJmd2jFHxDnbif6KIt3dpVNUfDgcSG8bHGOslzpQphygNlDfWN8ll8tngU+iUO/nJOFUsfh2dfop5TFsM3wC04VPmpHoVnG7GIv/OprOw1BJaoRI8ahWfnWTsTstMeR/C0JLAHCyyoCBxQ+ad+RJE85R/5mrD2ndRcEs2y5LViW1+yUKWIvpQSfHTpF5rxvSrCHoJBkjy8rpNAaE68a7qmX36ZQ8HImoMw1UGntUG2BCLfSDH45Q7bKsYBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQrXxJ1/ywpu0AZjyo32Go5eqEwExS2ugX3bLOHHimM=;
 b=d8IUnjycr/1p7pB0q5Bmo5xpOdXIKP3ULLN6IMUT1kIMavLEbe1H+glixomwcCMdvCnViXwj+BIkVHnzFFL8bALAn53CyBeAVanY4UdkyzNiFS37Iv3Pa30Hq3sb47P+GIiGFqwh0s9G6Tv2I4ABsU40d7pVMki7x5H5TpoP68ysCIgalh/qBI4Wvmb7DfOEY7hr7cEH3n8SAAWn5UFuGjyt4uaEDK5M6R1SjKWYI6l7blK9AQxBYxuCThIbS1elYq5JcGq8HTeXaSvhP9IsN/G7K+eyre6hLZ3pYKePUge4W7HNE31BK/vHBFCba0d3ne23IEo5fW4CI9VAv8URxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQrXxJ1/ywpu0AZjyo32Go5eqEwExS2ugX3bLOHHimM=;
 b=t04v5gUetL3oDNLQWS+wrbZ3dEHn17e8Q/oYJAedQwskgtoXM9E42lsfCjR1LepeUPKA2vg/QaesJsb9yAKhfbxjXqp2w+/cYJIvueWGXJq6+Kuwyk1QwBKduLX/AuhlUq7z+Os+HdWw82tYrE27OzOTUZIjvwFqcAEEayH5umDq4fDYWviHTe97FhP+0CcTahDNpJpc9fq0ZkGf3qo3mxnCRavw02fyoWlyWMZ3HCCRi4m1zAfbyQvrgAn5xblSshA68eHyxZh2O7vz3kngyXYuX88X6qGL2mki9e4V3d9GLKbiZZ6jDrLvHlLYAcJ8+5e4yKHBw7RgMa0+76Tbig==
Received: from MN2PR02MB6863.namprd02.prod.outlook.com (2603:10b6:208:1d7::20)
 by PH7PR02MB9965.namprd02.prod.outlook.com (2603:10b6:510:2f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Wed, 11 Nov
 2026 18:01:14 +0000
Received: from MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53]) by MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:01:14 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>, "decui@microsoft.com"
	<decui@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "will@kernel.org" <will@kernel.org>
Subject: RE: [PATCH v6 6/6] arm64: hyperv: Implement
 hv_is_isolation_supported() for CCA Realms
Thread-Topic: [PATCH v6 6/6] arm64: hyperv: Implement
 hv_is_isolation_supported() for CCA Realms
Thread-Index: AQHdaMzUwBqnDDzAzUa5/RZhe88vXLcpO6xQ
Date: Wed, 11 Nov 2026 18:01:13 +0000
Message-ID: <MN2PR02MB6863D42CE499C3D423EDBC10D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-7-kameroncarr@linux.microsoft.com>
In-Reply-To: <20261031001412.4150488-7-kameroncarr@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB6863:EE_|PH7PR02MB9965:EE_
x-ms-office365-filtering-correlation-id: 9700bb47-3da5-4a8b-66c0-08df401dc695
x-microsoft-antispam: BCL:0;ARA:14566002|31061999003|37011999003|19110799012|8062599012|15080799012|8060799015|12121999013|41001999006|51005399006|13091999003|25010399006|55001999006|24021099003|3412199025|440099028|102099032|40105399003;
x-microsoft-antispam-message-info: =?us-ascii?Q?pjB8Ls2M7s4tyZH+7hsB7XjsMN+k732f+t2k4gB398h+fyNSrC9rybbtIVoC?=
 =?us-ascii?Q?iz42C1DELkfEMOhFfQTqIj0oOSP36VUsweigSWw26VVyFV3nJASZggq3wTAQ?=
 =?us-ascii?Q?Awa7Mh2wmJLfZNWEg72wT2rJ+vR5YEPs5zCaa7veVL66pVaXmOLFPQAMMYlG?=
 =?us-ascii?Q?YeeEjBNNkByfWI0b43jhCR8LSwVwHJJKAng8ZoJXU7hWfhKTE+ejMoU4vJFE?=
 =?us-ascii?Q?I8ZA0Yc6z+Juh1elK5SIETT5gaqZtqEXONBI8mFOs+yjxZN9Fcu/h4AugoNA?=
 =?us-ascii?Q?clCWBsMw8YjFvPvbSz3l0l1Eg9us31wHmarfkfx59QdrYGjewei7xuD/0qiw?=
 =?us-ascii?Q?PYOdGHUqnAT8b1h0UMBvSOs/M4DSWUO/7QMYpvKV62r4vmXkyoyHTDd6adLY?=
 =?us-ascii?Q?W6zcCXqMvJE192T4DsODpvZIrZMxyKI3QUSa2bOQzQkH1k8oX8T1BY3047zT?=
 =?us-ascii?Q?W7LotyaWN6oeQIyK0JxMukTEi+Q9AglVAHnBJzw64kmCDlo57VuHYQS54s0Q?=
 =?us-ascii?Q?J7TBtspuA7qkDPAn7i4gsnMzx8zh/NsW7ejFlThJd+W1ZOrWS3ryavJ7zW1s?=
 =?us-ascii?Q?J57EFWmuDbfGRx9kSBlcZHpjB4Fr/pgFDoqNkerbOtIJ3aI0p1kiP1xnI6IW?=
 =?us-ascii?Q?F8mil56cvOaPZSdtFc9pmySuO/SDwJxq7zB7VwDssQhMxnIpcp33urWRnvf8?=
 =?us-ascii?Q?xm5w/t5dP6dUlwypn2i/+mcgVnR7anabUspRaalQyziGyYcDs+F5ra6t+NWO?=
 =?us-ascii?Q?mIXaRG6Tgw/H9QZH4ByBb1ePtTSMSARlLwCoWYAnTfNi5fH1JWdf+YnQ6cwN?=
 =?us-ascii?Q?XdKwNZbDospMBmKt9NkrfVnLGUCfrpYd9SUqo2IloNyHQ9ep8bIR9wgax8In?=
 =?us-ascii?Q?B+Qqs6Ai/JRzD3XCPzwHza+03kNIPMImUSw659wyVqgl7UA3pUAbHnU2+NqY?=
 =?us-ascii?Q?J02xtyd/PWSKaJD7L+eXrzknPHKmoIydQYnB/8wY3mtLyn1c9IV21ToKZup2?=
 =?us-ascii?Q?t//evwyZ7r6pTfQadXASldgFmH+oAyJzHXRs9r7psQC9i+zr82VxtXB9D9Rq?=
 =?us-ascii?Q?TsYfcM7gMyFFWBJ0FlekJvfQnI8VGRFN+rqyBsud9JYUQB+vqYo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q5ptC9ciNkt5nSUFUYpxQYVagNQ3bqB0d9tP2j6ZuMmiq9Qx8UcZ3vin8knF?=
 =?us-ascii?Q?SjODKDmIgkDFz28HqHy8CqLBhcSBfbHbkrrIyS+n2JTt/2PTp/+5EyXYffoC?=
 =?us-ascii?Q?t+HCmuxigHkYmJmg7eQ54L/xyCH1FF38e9Cu501jCGrH7LmDLac36iE9y00h?=
 =?us-ascii?Q?MUhc1zS3iHBw1OJw/elKJMRUBuK+6e01AOZcnMrbj3R3Fkx7z6pm9nJ9g2PG?=
 =?us-ascii?Q?4zKLh6k+9jgElVxlhIHyroFsi5OaZ83FyYynlt6jferaA4vGFb6dzzyoe2lT?=
 =?us-ascii?Q?ddwSZgbZjES7MGEzY9LGtMlaO0YzSQJnvsb1fT4Vy8FCSVklxewocvSg6c8g?=
 =?us-ascii?Q?Re5lwi/I12C3E8F6T07YO5EtWIDzfDhTAmSruLrW4ppL4EHpE8B0KRjLNaJj?=
 =?us-ascii?Q?ed85LhlSiiwRQSJgojpSFQJPcFfC3nNrmcTK0ZuNfoTqowzVIdbjc3mAUNkj?=
 =?us-ascii?Q?eEzcVe2bwl3cnyCO9dLiZWgOkYsmLkle5fmR2CULPLn15XD+E4bB7CD4n5rs?=
 =?us-ascii?Q?r2TjC5L2jV5xNvNqGLk3czrx5rsHt4f8q37Ivrxep69cM20dPrjPDa3cLKDT?=
 =?us-ascii?Q?kqyjxAn104usikDiuOlj1ihG7OOjDaILGYRB9bMpb5C7Oh8GR3e0x6al0t87?=
 =?us-ascii?Q?QKV5uO/qZQC96BOf+yOxsuNbDsKYAcOazKga4RplbblXoI6z3Hka9UkwGBK6?=
 =?us-ascii?Q?fYepm6GKSdLHIsHd7aUAV3CvOE/bjIsNDSIUl3zjq7f+sx7tGNlI5Dd/tuGG?=
 =?us-ascii?Q?M9Y/BErwMLTsghGkmW9s3cB41X8WvtdzENDmxrX0FbPYST7eXapxv37b13/l?=
 =?us-ascii?Q?4pdK1vIhBe1ykN51HmoVRdBJG+B0RkKziQfGez33CmzIJb7BjJdo6WaiKouv?=
 =?us-ascii?Q?kiVBzyZRNmalbvcg/3/cUTgyTCzhlk2ywRdJOo/8R4LFy/3rdrjYCzMLUJ2y?=
 =?us-ascii?Q?gqqCmrjf8sx7cGyf3ZLD99jfmSTo8Rl9zrUOuz15Je2cmL9KZlcnFsMJv243?=
 =?us-ascii?Q?759GzLZ64o+2E9WbHC3D8pdr4WV3qwlRs52E8f1V61k/lcV7LAFmCivAOziS?=
 =?us-ascii?Q?C2mMiH/ubB3w+cM8Jzbn96nIdIoToy7g3QLaUZY2jIZVc5d+fPonyrs16d/S?=
 =?us-ascii?Q?VCFDGL5tuYHRQ7rj2fdeXJl8YJuP/jdgaA1Xl95L5WIvUdcFHUzTQluvL3tj?=
 =?us-ascii?Q?DEARkUkV9ZHgjj7IjguNx0qiOqknxh32DqZ0vZZWj/kGhMoEvEG7UCNY+M4T?=
 =?us-ascii?Q?9cw1l7xVJZnlj8+wwXwwPnM48TT4tPal+x5NOTwemwlEUguhLyN9m6/ogflI?=
 =?us-ascii?Q?/25ZKxiIAcq8+jfTzhtvgAu5MrMQzQnnfOCBS5AhdgWrv/GeibumIec2spFw?=
 =?us-ascii?Q?jFunOrE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6863.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9700bb47-3da5-4a8b-66c0-08df401dc695
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 18:01:13.9319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_100120_540348_32E29586 
X-CRM114-Status: GOOD (  16.22  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Friday, October =
30, 2026 5:14 PM
>=20
> Provide an arm64 implementation of hv_is_isolation_supported() that
> overrides the __weak default in drivers/hv/hv_common.c.
>=20
> The implementation deliberately does not depend on
> hv_is_hyperv_initialized() because hv_common_init() consults
> hv_is_isolation_supported() before hyperv_initialized is set.

Quibble: What's the genesis of this statement about
hv_is_hyperv_initialized()? On the x86 side, hv_is_isolation_supported()
doesn't depend on hv_is_hyperv_initialized(), so I don't think you
are making a distinction vs. what x86 does. The statement seems
like it might be a leftover from an early version of this patch set.

Michael

>=20
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/mshyperv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> index da6c3aa0..8a2c446 100644
> --- a/arch/arm64/hyperv/mshyperv.c
> +++ b/arch/arm64/hyperv/mshyperv.c
> @@ -187,3 +187,8 @@ bool hv_isolation_type_cca(void)
>  {
>  	return is_realm_world();
>  }
> +
> +bool hv_is_isolation_supported(void)
> +{
> +	return is_realm_world();
> +}
> --
> 2.45.4
>=20


