Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D592D606C0A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/bVdIUg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RcznuWyK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PqbKYHS6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=; b=x/bVdIUgEiWGe8
	P0PD9yZF+VBSY0xPC7Id6X0KrOVdlqH7xCRVlESd7KKcVsGyDD9/BObzfdq0AzXMTTMJSVqJztEF6
	rBfQ5t26zEql44KnlChBM3EKrpRnMTFN+FaG1tvsW0Yr0AHvBBq/pytEzs0MdsXlJzu72ffDqCwrJ
	A6hBfXdyz50Xy4Ipj/3+HJ+I7FyaoyWpEpEcPIAe5UNmpLUWUCPsJ6+sJ0Y1CIHJIthUUVn9JSssR
	q3sYpx7lQqkxchC4FDXuaiLlkF0u5DNCT/BqWKKOLlIiAQEqw/JiNv46muY8DBKufQlUXX0gdWAcv
	2Op5r/Y8lNscTkJ5tpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNN-0000000DmgX-0ttS;
	Fri, 13 Nov 2026 17:47:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNK-0000000Dmem-39y3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:47:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRbm3296047
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=; b=RcznuWyKp1IBp9Mf
	p6xVOeD3Y/BJqD1rDuzzbT3i/578VJmkuaXrNGeAW7aRQwD9RaoBB6eCuAoF84BZ
	9NhLPsT/8N78CBXiGQnn4bY5ohFkrk0VvKX05XSEGtKCNpEYi9Kc41pkBeTJ2yuB
	2y4Nbma6Y/pr40wypVnROv/iBBYhSdqdyZpGJvGrgyeAZF2gbZ2JJhhFeHiELT8d
	dpk3RfYzniz4y8bWkk7RWTNdnbKu/2yUJHZSMxleFXp4uYv0KvBoYoDk0tnaZplY
	GbXuf6uYLmXthYtNQFM1BlD9+jbtkNNp3XEnpc+mZp2ap3/Ki6FWCSbmR1vWdcPq
	ixjK1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6teet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:47:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddc4bde4b1so1211426a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592064; cv=none;
        d=google.com; s=arc-20260327;
        b=e3uVCzU1VgSp4mF5SYwhx1jy3qc7FcY6OHN9Q1G/a+DLWiVjFw4nYRGmUpasx0lMIO
         o813fWE4HzHWNc5CgTcy4SWwnR/lM0RB/wqL1dhRMHib8O+WR7wkA50GEQpC3SmdW5Px
         L6BTxVdpQlzc9InSNOvRWFhEZjwNW03BMPETzLvUlAepLveKavBLNZBh2NeupQQLKHFO
         QcdfkMXhke8Wt5Kzz2KDPqFd3clrUFSILDCZrR+NThhg84OgE00JJW+iTUBsdpLpdYBu
         KFIJES77ZJkdXKac36ySKwRPo51MRz1DeKpZZu1UKNHjwh6+iv6jIOlbpf5QBhT1V+1P
         mwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        fh=HwgUJYbXZL1t9MChWbKNc7Zhn/KJ/Fdv4bHy1DTQsNg=;
        b=bgy4M63d5P/tPZ/US+oI+tVVzKqxo7W5c0K1A/PjXFw7KuYPULJmqeEBld/+83fO/6
         y20EpAdp+aRpg3uehItH5Y8GPrfG3Ngur7v5S6O/SsnTghNwW4w62TGetdKXr9K/tspD
         rXpeZrw/uP16d9k4bTsrdtYLdtN1cAbszYmZ7cQpzyArwezMAI0bE/hGp4pzShUqQEHg
         bYG109s8hB2Bgklr/lkpq+ZshmbLI4qjp89697Nbbk/7085VTl+S4MMNmlHefKxi8NVy
         4Qm5cRK5bxOlGRHL5Exr0Y+JVnKKvRA3OmDBB3QKFOUkO3MBgyH69ksybHOcROgBopJu
         FgJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592064; x=1795196864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=PqbKYHS6M6AQmrd1QCWJrRIK6s8JjFrjyIK+H8N9UU/nxQc/5d21QVtFbEIdPZw0WR
         pw2yjh3bffJa/Io3jZxaAj5upUnIOscklgH0jXWd640Ify1CnELM/ZQkY9HmMcijZZdV
         OukUy3JwEG2r5BXgcb9OCK84NLOJGVZMzn5bks8HtE7Zyl554FHH0/rVAJhLRHnxhoKn
         GRNhjmamidrBIR8JKr8/pgAKrRpJYEdn+tIJf3CX24OLKWGGTvNecW6wZ0o8+GtpfBIV
         N3VWKMvBTIFBQ4mtk2/jNA3Lw0AKnEYfP+3QmhG0H32OMW/wNhPWS0LeXF186IAhsnFW
         HT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592064; x=1795196864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7oP9kUiaU4IMzTAKOazExG143SLUu/fzcBtQwA6ZE=;
        b=izRIe42h3accjEU2m7EdV1YD6B8BVeM9wlpkWJJn2T4q2ReWjzODLE8hkNbJjLTSZY
         j1iuJXP5pIvvXzqNRm4M9kI5DOktJPwfqWV5H42pS0+AXPznKnrYGTHhAonlZyfFuD1T
         b8SuM3YQClAuVUCNcyiRTJWAT1kKhqDKAXnRtkiyWyfQT0qn1Zs27wxS0Bfts4J1Q458
         puQL+UXeFEevyzf4L37QZNz8KaKaDwvAz5OJMPRQx0B7lgqSTNoO4xM1yO764vND6AIK
         VzUh4p/V7KunxRCPaQHKfiy4tERjT+2a29UpdR62tOHZnUsG8aF8DOmJh666VdpIAw3w
         xuTA==
X-Forwarded-Encrypted: i=1; AL+hErHO1TRye+81Aa+EABN83CE9LHFhXotgLoUeCLtldBnGxGjqrZzeFZy1xwVIBdYEH/6foPGS4RjHAd7xZrCuD+Mo@lists.infradead.org
X-Gm-Message-State: APuU4Z86aWT2Ma0+oGPjwv9E9OBzwlROZ8migUH4idn1innk5Z0xreHa
	Ymim6xa8b7pdO+HzqgA+DtAeO+bJK4WmeYQHuTidDXEMkgLIE0tagUprF7VvSQa4dmKl3lwXaIW
	Ig8zjadSEwfPFxOM2ZK8S0Rvqt+ioweRpsd2OPAAy1OuR6pSKhO4Y7gWUhPPx923a7X+cWLNI/C
	GGeovDrCjdCRmDUPtlTcVO7Yg/XEASM3tJffgKR8k+RKWE2W4B1D00
X-Gm-Gg: AYBFou3W9jEM0ebWysJfb5GB3fxSS5/56ZlIP1ajGEDdk0wgi2FoHxtQ7rA0pfiq/1g
	rpVr+qadYWU8CPv8P6cdUSYHSkgYqo6/Ee8wgkHzaFWcf0NcSIp7e66VGIyK0HVupKw3Twt7v/3
	QvBPWBIbm2pEFJUJh6V5ou66s9AeQiGbDPRBBNTnNCB4+ThgwAxfPu4oTXjg==
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3f7a68a5208mr3120352637.25.1794592064034;
        Fri, 13 Nov 2026 09:47:44 -0800 (PST)
X-Received: by 2002:a05:6a20:d48e:b0:3d3:aec2:4dcd with SMTP id
 adf61e73a8af0-3f7a68a5208mr3120329637.25.1794592063543; Fri, 13 Nov 2026
 09:47:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019092417.391522-1-leonard@lausen.nl> <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com> <avYBtK0fyG_0--nN@venus>
In-Reply-To: <avYBtK0fyG_0--nN@venus>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:32 +0100
X-Gm-Features: AclHuK_J5EuV9dnZIsWrbl-naj0R0vX4a-pEYbeUab3qTKG86s3ZcxdOv5w6zDQ
Message-ID: <CAPx+jO82TGVDRqoz+TN86LVfraVVeNhHBFktTDNvVzM7S8zbng@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, detlev.casanova@collabora.com,
        finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
        inindev@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, gahing@gahingwoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX1EUKxPDRKOB6
 Ew9qVZcSrF8Ljj11gpcc6j5naLEswRpJ+T6FIalv9MyPJzDWVQcOkkeQtJHn72dJ7JsJAjEHQel
 jYQLR3YGGK1Id8yLmiJQKsnxyjSUAAx+/cCIohna2fyyLnHY+TjLf2xqn7zvRfCJoesFHrHi56j
 nGEnOmFv7hCaGxejh7628lniU/46bMJ/I/LnfU5bP+KSReg6SuOSuoGMZSkvvZPCpmxLvQ5vzjv
 bh+jVvSk9UT+WVHqMP2lut9WLart0Kw3YADbC7WUbHUi+n4LlzmHTC0WogwFMAMQro4wLbUPPH2
 G5uM3F6i7YG415jl4b14N2rumnedrimwBELqu2riO/VP1m6tLeptrfdQwrwWcAXL+xKVwJpCXOO
 q8rUdmjWlEaTcVmH6nyFP4d4tZjETF2d6qWJj4V2PapTKckasAk086c2u7Xk0cIEcUkDHZXuYcM
 jYGnuHmnL1MKZbpYOag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX794AsbHxWBiV
 d7sGhvDOd6ZQl8BpBwh/pVp9/FbUxjsSoyj0LT/mtbdGuUeWRKWP1gYtAUcJOut07YdN80iWNmF
 BpN4oGqy2pFIQUP0gZQ5iHgzFtzl6os=
X-Proofpoint-GUID: KktyOK5IPmt_5zuj0l7IVT9xetpkRPbL
X-Proofpoint-ORIG-GUID: KktyOK5IPmt_5zuj0l7IVT9xetpkRPbL
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af74d41 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=9GNsruGHAAAA:8 a=QX4gbG5DAAAA:8
 a=TNRU4YkNAAAA:8 a=mTdHOEkXxLqTN0UqMq0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=gf-oSkQAjqHFJRp-GQfY:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=T6RL-YpNOstmnv1gjOTq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094746_913488_3135CAB6 
X-CRM114-Status: GOOD (  20.33  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 7:16=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Nov 12, 2026 at 04:19:58PM +0100, Ulf Hansson wrote:
> > On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen=
.nl> wrote:
> > >
> > > On the NanoPi M5, boot hangs during Panfrost initialization. Before t=
his
> > > fix, booting required blacklisting Panfrost on the kernel command lin=
e.
> > > Loading Panfrost after boot reports a GPU power-domain acknowledgment
> > > timeout:
> > >
> > >   failed to get ack on domain 'gpu', val=3D0x113ff
> > >
> > > Add regulator support to the RK3576 domain descriptors and mark the G=
PU
> > > domain as regulator-dependent. This lets the existing Rockchip
> > > power-domain regulator handling manage the GPU domain supply.
> > >
> > > A corresponding domain-supply property is needed in the board DT.
> > >
> > > The regulator-capable descriptors are based on the regulator support =
in
> > > Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU se=
ttle
> > > delay changes.
> > >
> > > Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahi=
ngwoo.com/
> > > Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC"=
)
> > > Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> >
> > So this should be applied as a fix and tagged for stable kernels, right=
?
>
> Maybe like this, considering it requires regulator support, which
> landed in db6df2e3fc16 ("pmdomain: rockchip: add regulator
> support"):
>
> Cc: stable@vger.kernel.org # v6.15+

Alright!

Applied for fixes and by adding the above stable tag, thanks!

[...]

Kind regards
Uffe

