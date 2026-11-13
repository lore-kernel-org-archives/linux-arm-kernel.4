Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1V3MOjA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XnXIJ6gN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=; b=C1V3MOjAqYChcz
	GOan51ejiklbiSSzHd74IAyGS/I71au+BoHm0YCfJPHdbtoYk6V0OxOia8NQvbeB46URfLoop3qA/
	hhcHF810JmgJTcLM7VldienKDlJwe0DLxIcr1/zrM57SI53+Ft+4ylCL0KrFIW1Tau0Tog5kN/si4
	+oaLGAc+rYY1PLyBrov8R6EiCxGZ2bL8HfbAZm8T0Eta2gZExJxZWUV8LeDKifEGGf6I2A33903OX
	lUjDbEdembQGoxRdfxKpKPbrMKKXozbJYmfGMo4wmfv8M4CITa7Py7P0ziF/N0fb0a23X4kz5SYwm
	BqrKeSpBYIa3OjACpMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr2j-0000000CqHZ-3Gsj;
	Fri, 13 Nov 2026 13:10:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr2h-0000000CqGz-0o6S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:10:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcPo688852
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=; b=SQZEuSZ7/wGLKUxh
	SZQafe4FKG169IlGo5w2z5LX2QhGIOIambc41mKtHex1LIldaOimJFyoDqEMriAd
	1fwZQnuIc8aTSa740MiCIvO9X0N5M0wCHPjDupl/80QPEMSOrkkzhosQHAviy5dc
	mFxZB8cYlzWfDg43f9HAaM8JWZnI5CppA1JmvN7rlCuwOj6x22NK0Hzysox6dfgN
	igJ45io14zaZwgQDWfPaxpRT5XbkhekdxvdvNJYSa8DLQKlZs8C3jAbNqhnLVTLQ
	R1kO3B/Sj7jr686oS1akO7kAS2ji0+1fMGEgtaYJyKc15Z91AdJgwyzHe3hGZe9p
	wv5euA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjf5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:10:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so630095a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575410; cv=none;
        d=google.com; s=arc-20260327;
        b=B2+h5mKhWtLZyfX8toMMib+xS1ampfnDJOM5UxZo7Qw6OKvERLnREnLVhkjTCEOM+G
         yi5TqTLxQUr+0u9XDYCXYxe4euX9aciWI+lIu6Nb7Dexhd2mhmdOIbf8AfK4ep0n9Zqs
         WjhGB5Qraz6gDmdomrcR3HwzADrhjB6fwGs5OCBjnqFwwRlQ/PjF275nlc7pDqjzGRqY
         v3o5yWzGp0Y4dJqnvPUOLx5phcHiAKwi3h5ih4olFZugk9m91Hz4tDKza75GuHXmTM2f
         YVFzIKn2mzNTJUe4iYVKMOloELVIZfOdQAoKY0amMvaBDNICJe0Ip6XqWPo6/g2WHCNv
         DKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        fh=3A5F7pEdYyvawixOvHYo467bxRnByYguyeSBdFsGDlY=;
        b=k2Oan2r85nNzY1a/y9Vb3JFfZwTAl1gY6ljAIxLjq4nj83RdTWpK+YcRkvBcgv/CVJ
         3sEUKc2x6uWzvwBdHuM22Dft4nsj5nyi8CFbRbfSTi9xVG64mHdT6JUVQ4hyInVMz5Xh
         WcAb1sqSgnTP7usyxMhg3wib9vIDpAjykT2ZWarRGkuVeMAT896vO3DOHNbNyKrJWllJ
         ZeF8Rr0xI7LJLztCSL4QZysqumRWxCgQStgbz3eJr6jgHZaLHK5DUaGVVjo/zd7IJoC9
         bjZROICoO5/8R6mojPBAxwGcqgrBOEUrFYjjvpedmyHTiXC/Aizbwb8r/0/sgNwl7AIc
         lODw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575410; x=1795180210; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=XnXIJ6gNprp1Ri78XMGpu+jDE8NK1a1e9sPuL1ZY277hZE1TvhKq8jfi0HhrTAOUbg
         hJhtDdmjDaKkjUP2nHsnuJVARbWR9pMlNmLD5ZZVlXdYKWXm6X6a5Cpo0AiTOCVTJpwb
         vIEJBtyim+gm7TxUDquHkjmDc9ybWgWfxbl6VGiaJLeiNHxcC6KOAV9cx61hl1gx4RE4
         /ezgVVes/sXeqf/aPlXXEh4UpYJkhIWo+tvZoAgAY3ErGEMNnuABgn6tEYadhx11giQI
         9bcMTIBxdwAZNI7fxMJullBegE4m46v/SvxcixScepeH+ob7bbizj1BVBHPLaBJZLcaE
         bxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575410; x=1795180210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=OOXt0XPGgPPBvOggahTG6XrsKyFQNlNnom478Ch/+3BHeEA+BY3DRjfJfDHWQacgzL
         P2aDQDgrMv/1uAa+Kgn3XZMnLpPZIa9SAsi49RPJ/9qiHq5WejWANKNbEmIn98abk32v
         vyrgst+43S8joxvSTw94VJSVsFUo4L9ZIAwlDv+krGk6r3aKVuvz511OK+yfx5dZkv6g
         N8BsSg3LWtzAdFYZzFzeR5J7mUl83a5CkNDdFZS4H6vd5Hq52My/hYMP3MF6PV3rkk7U
         IpHYmFTKM89gjmKvwfQE8DuzvA+HuDAGP/tC5v48XPoa0qCqRZgY4dPhurtmoPTx6FLg
         dUdA==
X-Forwarded-Encrypted: i=1; AL+hErE+KVIxz2PnKIudBGJBFdeGtL0bJTs4hmiKzx3bE7C4BTiMSIUBI48+5jrRXsFDkqzTVzsgR9nNdGbR3SbEPnOf@lists.infradead.org
X-Gm-Message-State: APuU4Z/X8bl2rbC4XbsuS7hNrYWCSgB8T8yU8GXil3cbV6Gb6ovm5ROj
	+ggVwId/Sz4pc/l+nBbmuUZyjJQv2lG9LxWC6I+ZCWpi5pHX7L8revQj5rnB5VGEmROF8MZlnTv
	V+WOy+hxGNrmrsdd3RNv/rZJbvTiizwGULJ522YjqjM4A+ommqOzhRq+udbMrKujeMCgMWbyIJD
	6C2zquzxN1FAJ8u1w5u8mbFy17tl834cgb10Dy2UhhFumdZ/FSZIDPfeiGavu6
X-Gm-Gg: AYBFou1M5xSUwb7EwAl0dtYI4HaIz/KrfROllfzrom2IDrIEvtlsmyh3Cagw97KF6Pf
	cn9Kr6Z5q1RuuCz1N8o7RUwSg5GLgylpjr/VojNs0PXaPMieHy+GOy1ydfDm/tWiXKdQlqbck5I
	cJ8b68XSSp3CxZWcjNefrjYVpcsGIv5kA7AAhBBnS8Mb+BgVLAB1Gb+N49ug==
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr1919435a91.52.1794575409671;
        Fri, 13 Nov 2026 05:10:09 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id
 98e67ed59e1d1-3b1b0b85d23mr1919378a91.52.1794575409140; Fri, 13 Nov 2026
 05:10:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:09:57 +0100
X-Gm-Features: AclHuK-XrooPPikBTcYU6ieoCi2hLf5EMDtx-gXhYpRfrFw3mVoiL0ydev7kJnM
Message-ID: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -7p4tYhJY8RU1jO_uOED-a2PGudC6l3G
X-Proofpoint-ORIG-GUID: -7p4tYhJY8RU1jO_uOED-a2PGudC6l3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXw5qJ9/5RuGJa
 EY3lE5L3c5QGIXWgrEJJgVipvsnw4yt/V3ZejeNkl7w4w5ITr/YgLMILD8Z0Tzg4BQ3Ucer4ap2
 xiqQ0Fwo93XLDKLtPlp2DHTHP46NCXGzq/lbkJg6rcTumqHemkXSMtoUR2hLAIdFVzLl394oX8b
 3mKK/iXm4bYiuW0pib5E78WyA97+5RQQzp0qUtplQ72zdjPcDLHkF6bbhfWcNIjBIzTR2NHfEfE
 P+QB45PoEParMtHzPMMtaxdPpitIb057BN1lZhHckOARr1RVFEQpN9iu3sM0gOC236gesYIFQK5
 wnTlLIVMyOPMJfCmlQG3wKsmbA929L0CHS7CN66HRBtYUSRWD6vlg50Pcr8qylQzFhRilXnRin6
 WT42ewemasuWiVH6WRcveGaRYUR3SLo7yBIrIR0vMqeQ5KkLoJtni4WRPXZp6kiG4GKtzYI/ZwW
 eD6P0Wn/RMv4tHRO4zw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af70c32 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=E9o5ywDmFEx5B8TChakA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX4/eavjdcpGzf
 H6YIJ8NuZsufv7daCny3FmD14NdlYzAswVMCZB5O/FZvqCmbmZ0VGkWTaQWDBnGSQYllBbjI8gr
 iyW0SWl5vbZp9LkeD/yLZ3fVx5tyIRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051011_240330_C645C3A1 
X-CRM114-Status: GOOD (  27.01  )
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

+ Sudeep

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.
>
> PSCI provides no call to read back the current suspend mode, so the OS
> cannot tell which mode the firmware is operating in or why the switch
> is rejected.
>
> Add an optional flag that tells the OS not to issue
> PSCI_SET_SUSPEND_MODE on such firmware.

I think it would be nice to further clarify what's going on in the
PSCI FW. If I understand correctly, the only supported mode is the
PSCI OS-initiated mode, hence it's always running in this mode, right?

This is clearly a violation of the PSCI spec - and I guess updating
the FW isn't possible at this late state, or is it?

>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, rewrote the property description,
>  renamed the property]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 0d04389c81..2eee38d155 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,19 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>
> +  skip-suspend-mode-switch:

Maybe a more descriptive name can be found?

osi-mode-only or broken-suspend-mode-osi-only?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Do not issue PSCI_SET_SUSPEND_MODE.
> +
> +      Some firmware advertises support for OS-initiated mode but rejects
> +      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot re=
port
> +      the current mode, the OS cannot verify the state the firmware is i=
n.
> +
> +      This property is an assertion that the firmware works correctly wi=
thout
> +      a mode switch. This is a workaround for non-compliant firmware, on=
ly set
> +      it for devices that ship with firmware known to behave this way.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
>
> --
> 2.56.0
>

Kind regards
Uffe

