Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EBD606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sinlTZiJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=isZAzEjw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeYn2ssx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=; b=sinlTZiJRuNZT0
	heIL+19c43ezlpRzJn9qKWkKBPYb8lL8Mh1QliKswGKaxg2PjxQgQKZrz5o0Gx4OqhIgSVmSnO54R
	2mZnzIccg7semeBuTRKLW1I34Y5l75ZppApIz3ENXyRy3mH1qNdfPOFcL4uEkji937fLv6FRKeH92
	Q3gFgcZzqZvvE9LtoLaoxt5ncsfCr8X7U6pyWVWrQuMGy9UPzLLIEPKlSU47zYDgSZcbu7t/DQzis
	8U4VIFrfDJIS3/eY6z3cZmbwvHpgg300Bh9+rYce70uUH0T/i2+CivekqoHntJEKRJsQnUlunwab0
	ai6rtXCMJqO+XNwARhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWik-0000000ARlm-2pFa;
	Thu, 12 Nov 2026 15:28:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWih-0000000ARlE-0gSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:28:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC99Fu54149279
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=; b=isZAzEjwKumlixI0
	DrwYp7TSLWkN+oTpA9eciLdB3BssYhOhb9HwJJUnPhBVY01KxJ3eKN4hX2twziJZ
	x8P9jVovz/sKgkPv0rV1wlHtnkNplB7rO4NcSlV3LMffdwvPjNwzm6MV8LZP7gfh
	YfS8REewWUI44q74Z70Ezm03vlQj+dGd7hN/pjkyULkNAaONC0hAvr+6Oa0gLXaO
	S9RkwJaZxFyL8XF+0NPJW6/cvjbijKcxZd0kHVjRSFrE1RRLX58xv9aSUXkwbRPQ
	CdA61J0XbkRSTZGgDa1U7j7yN/6QmkunQwYPuk8FDnrETXWCYUstOLf2E6/YuDKS
	tivIWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc641qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:28:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so806875985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 07:28:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794497289; cv=none;
        d=google.com; s=arc-20260327;
        b=CX26KAnVdVL2CpUbFU7yPW+GLwj8G1RzuNLA5D61RWxlvhOEyiLbdYu108VJPsPX8L
         xHg/SVrJlGjwI31HeP+Dc+c/zFC8/dTYzfVm4+r4Jav6Tk/lqoEUjSEg9ztADwQ/KkdN
         buWgeom8wwZHNGkWGE4BMYkfuzIheDo3A2Ria4Z3m+hFeKgeUzOPHkmFpmHQ1AMJqxi6
         jiZCnqHbI8QALlLhO7QyHLOhQpF03pjTg7+jOKELrapW6cX9wWp7TJ2IBA4Zabp6rvyl
         OiTwGANICkNERfvrImuHgyMDb2OP5I5/Ntg7T9SVvKdYHAc2vBUNJG8ZI//jtzyJ7NZJ
         Ni6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        fh=jvHuZbeKH52Lt4WR+v1L6yHCri2iXoAEJFA6pPm6u7g=;
        b=TNzyjkH6mZMuQTlWU0ux1Lbwl/GSunlRCdgBPU+awGlVYhB7JPSnqE+l2X3zZQ+Q8A
         LajKt4ta7dBTemrpXYyjNNWQ/f1qQBctLoWk2OIwlOnJGcjMZHCpQzFX7sstfE8cr0iv
         5TuWdc7q3m0Xlzoz2E3bcurtP9bajhb+RyTK9+PZ/VmQ0TUP47hZP05P/Q2nbgB4TKE0
         Y9hlRuPduwUKrm0pae3MGLEspokd0rMHn+wDiL1Z9Tycp30/F0bLXr1pjUefVumBs94E
         Q576zgtxJctq7HK2Z76JJkuktLN7OuM7LED2xukyKMuvx1DJo6/CO3SxWQ+MfuSUKNaf
         maug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497289; x=1795102089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        b=BeYn2ssx9g6sP97iM0fvtaloQ2JoBrPc6TfdIXi8iuG6syz/3NPaiQ1mHWY5v1ydgb
         lzN+VT5T3voO0i4YdXfpemcwGq+dnTB+fnWRcnrTJGD5WjpD6H+3CbzVnUVyJKXffv8V
         SJERsxqLXm91gjoyEt1c7YX7x7oy+3FQvyzpWuE93JzMgQRydS4OX9ZvUhXVCR22GX3E
         iY6KnPmGWXMJ4mj6yFTBt5Imxe1nWFFLkn8n20sYdvHaHyJ+pArUr10OM3RWJU1k7vSG
         ua1JmW52b2IoswdxK44BEmKYMAXs0vTpF+NDieas7kxDmLlJuZ/10qWFYM4LabAIFyaW
         CXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497289; x=1795102089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fIl7t38r6YFHA9TzOGRmGrOug9wzJn5bgunm8JUJBI=;
        b=CmHZdSvQ8jZzNsmy3S1eItkt2V880+GKdsukOWl2h/tnLbdtQCNvc+U3wxZ+RHuWSv
         YVz7LiASd9nuXxzmDNzBKmHx/CvSY/MDTEvf9XsNKFs5+z6ftvvec+hkdXbtFpQX5PHV
         XEIRu+z2i2dDJ2359FZyPO4AlfJcSCFVLsSxtWVv6Ek219Hvf631z93WKnX1VD+JkyoM
         6j7NsK5SsgZcTnzpl4O3Y2as/wCfxma5AVrWzWq5XInuGELpfyrpA2FR8siOQSjRc28w
         Qm+goCptR5J1EGoOYURNCCROq+YoWwyDkrAmdX1gIFxsHnIv7Qtf6HSVKmKuRCBTtaxM
         aMXA==
X-Forwarded-Encrypted: i=1; AL+hErFi1ld+plEPu2FyhR82Yk/SS+72lqcBhwI6K5OeSMXKzi33vDb4z2CGLPuyAtvOe9bKvWBk+2fkbPaX6j+aoY6b@lists.infradead.org
X-Gm-Message-State: APuU4Z+lLttyR8TM3QBTaeOV4KODbh9KpV+AE6vcprf+llrp6kMecA3/
	FsB/glfUjBWpiSOCMnjAEjKxEcCzMnEhk+RTUNy1lTQjvey4JrV78jyPWq9vApiCh5doMPAW5GX
	0T2p1eKMR2trYMyazrnMtpnXLzD+O3vsYBYaOEQ+ZIY3hknp4Fq7u53cUsztukreMZoD+HQmwYb
	QckrbQjwU+Ku3pDOgZ5au1W+H/Jnnhc1lXgMiSGYzHsMLnc3uVe+q+
X-Gm-Gg: AYBFou3RT6+wPMYBp9jfCN18Pypmemi2etX+IPSO+fNxZFEYBef8Wo0bW6LIV6YWb+H
	2eDyNOehLhbleHhMNhJbNR4wVQ2eiNcDkO1Ic9vEeGIMs8gVyzr1x6iooc98kEzNhLLlKDgx9bV
	nPOu/EqJn2ujzhR7pLSM72bGRdZYHfPQzyYb+PdoK5KH2RG8raNekClK5nxA==
X-Received: by 2002:a05:6a00:f8d:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8bc1bcd60d1mr5466780b3a.26.1794496810719;
        Thu, 12 Nov 2026 07:20:10 -0800 (PST)
X-Received: by 2002:a05:6a00:f8d:b0:886:3a6c:a9da with SMTP id
 d2e1a72fcca58-8bc1bcd60d1mr5466739b3a.26.1794496810109; Thu, 12 Nov 2026
 07:20:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019092417.391522-1-leonard@lausen.nl> <20261019092417.391522-2-leonard@lausen.nl>
In-Reply-To: <20261019092417.391522-2-leonard@lausen.nl>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:19:58 +0100
X-Gm-Features: AclHuK9honMV6OwgXNyYrNEkyUm1bD_efoW1xKgxLOXh4P3goN8MpuuCosIlMxs
Message-ID: <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain supply
To: Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, detlev.casanova@collabora.com,
        finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
        inindev@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, gahing@gahingwoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kV6JHXxMHj0MaLMfbAefXbCCDAY_jwCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MSBTYWx0ZWRfXxTQoVO1o+7tu
 X3ClC0n7HFzcoVuyjMdfZf1hTzfR/aQThoNpfd0Qws49vkmjpPQ7FY/xMWOblx+QSXkjWXfCgm0
 m7qWP9s1Hg/8w/2mpM5XVexR7Yxm7QAQGJK4p2ZCSB3dcZQxOlagLvcSL2CKLP7z6rjB0CXXBIX
 TLiDnPkN1XA/eTCBM5E7Y1cywPV3oAZWPLPEchxifZAg5FH2dc5UWKLJRztaJOxZ56K1o8qn2YT
 k0CzKR7u+ai2IhxQnOQCZ7cADO8pCBA8Oqe5IeG2r6M5iTSZB0s2xzIkNWLS60aT99OipkQVd2H
 7g3u/DwE9mIIe+J7X4z3nRehjphtj4LAtIK3hiLzSHm1TZBbwlCnUsbxJOj6gaw3viDcS3ionTh
 mnnxvQ2SYbDx94KfVd4HkiRqDQP8kfktE40GeS9KrmRIavOJxLGQKiqnxslIp+xOpd/EfuqMZmb
 U/DWdNin2om/FH3WNHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MSBTYWx0ZWRfX0C9IeuoRIxhm
 xnnwLs3AjQ1tfcpORsVA2ztVThInj5urgxEoPnDL6I+s5CASnCWi78DDzvKN/5Lxn7OAyHhIltq
 oAsUw0tL0WsTmUD3WryqQ6k8GRsRh6U=
X-Proofpoint-GUID: kV6JHXxMHj0MaLMfbAefXbCCDAY_jwCa
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5db09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=9GNsruGHAAAA:8 a=TNRU4YkNAAAA:8
 a=9z9mmZE1JoB7TLlessoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=gf-oSkQAjqHFJRp-GQfY:22 a=T6RL-YpNOstmnv1gjOTq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_072811_986431_84A6DD4B 
X-CRM114-Status: GOOD (  23.30  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen.nl>=
 wrote:
>
> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
> fix, booting required blacklisting Panfrost on the kernel command line.
> Loading Panfrost after boot reports a GPU power-domain acknowledgment
> timeout:
>
>   failed to get ack on domain 'gpu', val=3D0x113ff
>
> Add regulator support to the RK3576 domain descriptors and mark the GPU
> domain as regulator-dependent. This lets the existing Rockchip
> power-domain regulator handling manage the GPU domain supply.
>
> A corresponding domain-supply property is needed in the board DT.
>
> The regulator-capable descriptors are based on the regulator support in
> Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
> delay changes.
>
> Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwo=
o.com/
> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

So this should be applied as a fix and tagged for stable kernels, right?

Kind regards
Uffe

>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f35..b41f9fcb62bfe 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -176,41 +176,42 @@ struct rockchip_pmu {
>         .mem_offset =3D m_offset,                         \
>         .mem_status_mask =3D (m_status),                  \
>         .repair_status_mask =3D (r_status),               \
>         .req_offset =3D r_offset,                         \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .ack_mask =3D (ack),                              \
>         .active_wakeup =3D wakeup,                        \
>         .need_regulator =3D regulator,                    \
>  }
>
> -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup)   \
> +#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup, regulator)        \
>  {                                                      \
>         .name =3D _name,                                  \
>         .pwr_offset =3D p_offset,                         \
>         .pwr_w_mask =3D (pwr) << 16,                      \
>         .pwr_mask =3D (pwr),                              \
>         .status_mask =3D (status),                        \
>         .mem_offset =3D m_offset,                         \
>         .mem_status_mask =3D (m_status),                  \
>         .repair_status_mask =3D (r_status),               \
>         .req_offset =3D r_offset,                         \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .clk_ungate_mask =3D (g_mask),                    \
>         .ack_mask =3D (ack),                              \
>         .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
>  }
>
>  #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
>  {                                                      \
>         .name =3D _name,                          \
>         .pwr_w_mask =3D (pwr) << 16,                      \
>         .pwr_mask =3D (pwr),                              \
>         .status_mask =3D (status),                        \
>         .req_w_mask =3D (req) << 16,                      \
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .ack_mask =3D (ack),                              \
> @@ -250,25 +251,28 @@ struct rockchip_pmu {
>         DOMAIN(name, pwr, status, req, req, req, wakeup)
>
>  #define DOMAIN_RK3528(name, pwr, req)          \
>         DOMAIN_M(name, pwr, pwr, req, req, req, false)
>
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
>         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup,=
 false)
>
>  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
>         DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
> -       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup, false)
> +
> +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, wakeup)    \
> +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup, true)
>
>  /*
>   * Dynamic Memory Controller may need to coordinate with us -- see
>   * rockchip_pmu_block().
>   *
>   * dmc_pmu_mutex protects registration-time races, so DMC driver doesn't=
 try to
>   * block() while we're initializing the PMU.
>   */
>  static DEFINE_MUTEX(dmc_pmu_mutex);
>  static struct rockchip_pmu *dmc_pmu;
>
>  /*
> @@ -1323,25 +1327,25 @@ static const struct rockchip_domain_info rk3576_p=
m_domains[] =3D {
>         [RK3576_PD_VOP]         =3D DOMAIN_RK3576("vop",    0x0, BIT(11),=
 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
>         [RK3576_PD_VO1]         =3D DOMAIN_RK3576("vo1",    0x0, BIT(14),=
 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
>         [RK3576_PD_VO0]         =3D DOMAIN_RK3576("vo0",    0x0, BIT(15),=
 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
>         [RK3576_PD_USB]         =3D DOMAIN_RK3576("usb",    0x4, BIT(0), =
 0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
>         [RK3576_PD_VI]          =3D DOMAIN_RK3576("vi",     0x4, BIT(1), =
 0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
>         [RK3576_PD_VEPU0]       =3D DOMAIN_RK3576("vepu0",  0x4, BIT(2), =
 0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
>         [RK3576_PD_VEPU1]       =3D DOMAIN_RK3576("vepu1",  0x4, BIT(3), =
 0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
>         [RK3576_PD_VDEC]        =3D DOMAIN_RK3576("vdec",   0x4, BIT(4), =
 0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
>         [RK3576_PD_VPU]         =3D DOMAIN_RK3576("vpu",    0x4, BIT(5), =
 0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
>         [RK3576_PD_NPUTOP]      =3D DOMAIN_RK3576("nputop", 0x4, BIT(6), =
 0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
>         [RK3576_PD_NPU0]        =3D DOMAIN_RK3576("npu0",   0x4, BIT(7), =
 0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
>         [RK3576_PD_NPU1]        =3D DOMAIN_RK3576("npu1",   0x4, BIT(8), =
 0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> -       [RK3576_PD_GPU]         =3D DOMAIN_RK3576("gpu",    0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> +       [RK3576_PD_GPU]         =3D DOMAIN_RK3576_R("gpu",  0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
>  };
>
>  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
>         [RK3588_PD_GPU]         =3D DOMAIN_RK3588("gpu",     0x0, BIT(0),=
  0,       0x0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false, true),
>         [RK3588_PD_NPU]         =3D DOMAIN_RK3588("npu",     0x0, BIT(1),=
  BIT(1),  0x0, 0,       0,       0x0, 0,       0,       false, true),
>         [RK3588_PD_VCODEC]      =3D DOMAIN_RK3588("vcodec",  0x0, BIT(2),=
  BIT(2),  0x0, 0,       0,       0x0, 0,       0,       false, true),
>         [RK3588_PD_NPUTOP]      =3D DOMAIN_RK3588("nputop",  0x0, BIT(3),=
  0,       0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false, false),
>         [RK3588_PD_NPU1]        =3D DOMAIN_RK3588("npu1",    0x0, BIT(4),=
  0,       0x0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false, false),
>         [RK3588_PD_NPU2]        =3D DOMAIN_RK3588("npu2",    0x0, BIT(5),=
  0,       0x0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false, false),
>         [RK3588_PD_VENC0]       =3D DOMAIN_RK3588("venc0",   0x0, BIT(6),=
  0,       0x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false, false),
>         [RK3588_PD_VENC1]       =3D DOMAIN_RK3588("venc1",   0x0, BIT(7),=
  0,       0x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false, false),
>         [RK3588_PD_RKVDEC0]     =3D DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),=
  0,       0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false, false),
> --
> 2.47.3
>

