Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jUhLQLZJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFkwc1Iy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TfdXZed4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=; b=jUhLQLZJaiWlPv
	QigA7RvRMCFY1cmrHyQYwi3EXWwAJbq0Vdpl988pWuLdfd5zYvY9H8ARX67pkEB5+qKwHcLgWxY7D
	ooYge90/d2lxQqfOvh8eod1J3XM0VqwfNk57MVziTqTs7siKBbG752p29UYzWyTsB68jDibOm7WnI
	ze9ad8WurS2k5S7osVBUOijqtuRPO7xlhp2HOp9NQhPYhVbFiyJzCS9QhYRq6ivh8BFsG0oLKIq5d
	ut/FoFB4I5tXC50TSm4OJlK8jnBQgBoIvqfux0DPFR/EqBJ03xMr4XSeItgQ753fvKhGB7rqUq7kB
	D4sCR3aR00tfbmFhzHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjW0-00000009mDt-34cv;
	Wed, 18 Nov 2026 17:32:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjVx-00000009mDM-1YMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:32:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGkag1155236
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=; b=pFkwc1Iyuzm6QtDB
	jpsJ240F2OsnqEDyuEM9eL3utOmm39sagvXqEk1Sui825XGU+BgTf1jsT4Y7HC+K
	USyfrnC+eNY7LltVz+nv00s5wEZXbWjT2SmSF+TAEMe+cClCjyR1Jnl1q7OZnPZc
	kghsxF/P/OH3kEMGdkapkioydXTlexe4fLYVy+xli5AwkPdTLhdcKUXKOPpLT9zJ
	xet04GqFXxPV6kHKKudVoccNsnXfRXGcCsD1Qgna+TdHOU3WczSnxzjz5H9jQozY
	P/T+GbLcRBg+RbhjISf2YB45doJUOSzNg9Ud7jKvNdEgPCMoBTi1lemTxk2KpLjW
	7CVkQw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9eg2d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:32:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-381dc4b8f40so1496377eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 09:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795023128; x=1795627928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=;
        b=TfdXZed43qTvU1UwwGsA8jTMe2TiLmL/dt41vMa2JaqViZcqVHxiOTq1RDwfl83Om7
         7efdEo2JUgdWRiDCNf5OywXvKvkDHC5lx4RC3Hor+p1PZf8S4geAb8dlH6Z9iD2QMmrT
         3zwLWM0txcys+Jm/OsQ2sN6gjBwM5GWfiSbPx2K6ZtN50GoGIQNyRPFNouv1AzjQdhTA
         39QUob8mM4+Ex47oR6vcxDjzGSjNnA4fy3XWFe++VJk4kbmolJ+M1s3Ows/i0UTSHPxA
         /eWogQEwyRrDIB8BgziHLXVb/uXx7CVBIhN50hPMCOBzJKUdkaaZ4VtfoQrKG/qwHnXR
         KYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023128; x=1795627928;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHU3OVQcJmZgw72w0jml0JK+bFdjHCcLJtdZKnwGXA=;
        b=T3DOSHgWzTAlS/gRvwTD4nEytHqyNr9+E77tsbwElNvlnfs+1D/f+JjdZw516hwsVk
         R2TrIvA123iT8MXptbTRbc+LEJGBEApIj87e1imFqntPRyufIqX1v9EH+gaWMJ+KkEDX
         5Z1j0IdIZc7Znby9GZNkG1HVkiEsnTPx4XdIZntin3vCje+lVaF3o6EFQ9D+KdV4QM3I
         pIuyzo6nQdoAyVVIAP3Bqcr5Bli0OPtosIkJBbSpgxfTp+MO22bphd9RDnTcyaRvOtVB
         j2j2Im2ddrXHYt7tRcOJ8QJWrHtanJUfGNVLj9s9UHY8soFX1I+VA7HCnhDJI2aID4Y/
         8UyQ==
X-Forwarded-Encrypted: i=1; AL+hErFNvYl2FItO+7V9CeyRHDnhQSyiCTv7GYR6XNiBS2AF+q0aDehU8N3JCVirkaKpN0oq91CVR+vD3sxlFNglq6kQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9tMPN+5/eswrqMo827DSgwNwCX8Jgtj/3/Q6ulnpNm+ynO2BUd
	HeO2CmfmZsPhJtA7mPww8wn6IT5oh8/hQJw74Ft/l8NoTShuscXGduaF+xMpOIHrd9f87Vq0Pqs
	RmpMKFGXHXaB8QUqleFTSdEeN9/Og0yFh/ZT8W1HU7w4b/t7egK7WlnC7lwJtszq6uB5/Eak8JG
	wKnA==
X-Gm-Gg: AZFdTZfFwGh3BgZwDC+RrShxX74ZPMw7P1rwaO0JkSgRZxd1kO6G5H1NGBxvmV1qBoQ
	iuzl5w2jLy37sd65B4P6GZPx6lQPWcJdLDS+/bkCLfSYOjRYM/KOTS4/imoT78FnARc7yMtaG+c
	EZClI7G3Wq02A59KETKSI1GTiXLF1O5O+YNhJmYJZU6x1CsAfHQ6CTykDH/XWneKAQjtFrvO5tY
	sCRbu007D8h2MZt71Cx/zbcBgehucuvm531uqNFolpTiRJZaQfe9LHxIBc95CqZvqk7hOYOM3X6
	ltNSVb1gkIlpQxz3Y4bgCwfuwNpqlc3QO2d3qCP4j3dKoRiYSUL7tAI5oQQuAZGWCLWZteYgRWt
	bNmsDtloj/cKCChlci3089+WMZXrcgxcBZ9MHZIpHKLvWIfzaeK3J8PWMBfxIaQnX7Lr/anPKk7
	rzuIrGADLATkicr/dXvBbtevkOOfUg
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-3828181369cmr3425938eec.35.1795023128086;
        Wed, 18 Nov 2026 09:32:08 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-3828181369cmr3425903eec.35.1795023127474;
        Wed, 18 Nov 2026 09:32:07 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm13849129eec.5.2026.11.18.09.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:32:07 -0800 (PST)
Date: Wed, 18 Nov 2026 09:32:03 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118093203.000069f1@oss.qualcomm.com>
In-Reply-To: <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261117170709.00002088@oss.qualcomm.com>
	<20261118-poetic-robust-raptor-bcff2b@sudeepholla>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfXyGH0Tm23w+tp
 jaadcmVQVqY4Pf846GUvyTrcFcK5WQNmF/OH4vZycIE0/hJnuosYn1/tEJToxl0FM8vl4vnqyb+
 UNP82OBR8lFuUpeo7QK5CZkiltplGywkJkxlPrYeRYC6MVabePgdkMx2127mxEkGwgpmmxoyVXl
 L3M6Qtuap1OZVSsO2P9Kbp3dOc3cYPctiewA3q1KqolEMNEukKNTC2laDR5ZlQdWESvUlTdZUlA
 vI1i6rhHfrN1LdS31VDdDh6AwjVSn13RWgZJVYotQZDC//MA8qU9mKm4S9jcxHgLG4URO5X+RMD
 3dj1WZV0+99FpaEapDNJXnpZGQhpOsM74tApQ86rZdY1kHPsOiZqLvAMiyczUd1W7YUHXDwd2D7
 v9YrZxrtmQao3K0ev5hqvxqR6gDbInO8RzeTAFZtvZMHbLYutB+TgAXmMKewf4GIrPQYer3bBab
 WyJBMSzpZ0JDHc2Mu5Q==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afde118 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=ZJvAkwxlLmQLexqbkCwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ORplEwIUgJfdGfJX8DbYp2DXKQw7ABhl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2OSBTYWx0ZWRfX/SojHsgv+tD4
 QPCrAZVrSiaTi4gGVx+evy8mKuSPRNz1CpJuagqw7ppjuKagGODv+063fdKtnPjVsiawVUzNf8a
 p3l97P/ZhPKQ86EigFcOWynn3rwVhyI=
X-Proofpoint-GUID: ORplEwIUgJfdGfJX8DbYp2DXKQw7ABhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093209_416764_E7DC5F6A 
X-CRM114-Status: GOOD (  34.98  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 09:33:44 +0000
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:11:46 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >  =20
> > > Hi all,
> > >=20
> > > [TLDR Summary]
> > >  [V15 highlights]
> > >  - general cleanup and hardening driven by reviews
> > >  - improved TDCF access routines to minimize lost samples under load
> > >  - completed ABI docs
> > >=20
> > >  [V16 TODO]
> > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > >=20
> > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protoc=
ol
> > > dedicated to System Telemetry. =20
> >=20
> > This is one from the family of issues you find when reviewing ones own
> > (well LLM generated) emulation, realizing it doesn't match the spec,
> > and yet works.
> >=20
> > This works fine without the required SCMI protocol property in ACPI.
> > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > Platform Design Document. 111115A 1.0
> >=20
> > Now, in here is an informative statement...
> >=20
> > Protocols not listed using a property may not be enumerate by the opera=
ting system.
> >=20
> > But they are...=20
> > =20
>=20
> Correct, I intentionally left that out. I do have a patch that restricts =
it
> strictly to the listed property. However, I held off on pushing it becaus=
e of
> an issue we saw on an internal test platform.
>=20
> On that platform, the firmware advertised the protocol to the OSPM via the
> base protocol, even though it wasn't functional at all. Once they realized
> this, they simply dropped the entry from the ACPI SCMI device as a workar=
ound
> instead of properly fixing the base protocol discovery. While understanda=
ble,
> relying on that workaround delays proper firmware fixes.
>=20
> That is why I went with the non-mandatory "may not be" wording. I am happ=
y to
> merge that restriction patch if a real production platform actually needs=
 it,
> but until then, leaving it open helps catch and fix broken firmware
> implementations =F0=9F=98=84.

You can't merge it safely as at a later date because chances are high
someone is relying on the current behavior and not presenting that
(currently pointless) package in ACPI for some protocol or other.

I'm fine with a permanent decision not to check this but I don't see it
as a thing that can ever change (except maybe now whilst there are not
that many platforms out there using it!)

Jonathan

>=20
> > So, obviously we can ignore informative spec lines but that is a pretty=
 strong
> > sentence. I can't immediately think of what would go wrong if we ignore=
d it
> > - maybe we'd not pick an exclusive PCC and fallback to a common one the=
 firmware
> > doesn't want us to use?  But if it doesn't want us to use it why make T=
elemetry
> > discoverable on it.
> >  =20
>=20
> Indeed, falling back to the common channel lets us uncover any underlying
> issues in the firmware implementation. That is the exact scenario we hit =
on
> the test platform, which convinced me to hold back the patch.
>=20
> > Should that be wired through from the ACPI parsing code?
> >  =20
>=20
>=20
> As mentioned, we certainly can, though I'm not sure we should. The "may n=
ot
> be" phrasing simply leaves the choice up to the OSPM rather than mandatin=
g a
> strict restriction.
>=20
> > Anyhow, not something I care that much about but thought I'd call it out
> > as an oddity.
> >  =20
>=20
> Thanks and well spotted. Much appreciated as it brought the information o=
ut
> which otherwise would have just got lost.
>=20


