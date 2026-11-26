Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MBJDBrov;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb75Bhnk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdJAf6OR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=; b=MBJDBrov3wEF4x
	ncup8zt15f8uEh1y56ICHvOXq+31Qcf2a0yx+4CVtIURCacriWHSt2WVGADlR6WYgGJvFVJwHsCPT
	5jqkeHZlRgXnb2gtYJ4c/nWWDegzn1HpukJtVaNXww3PFpvzg/7zSqz0GvJQjyoucJ0GNZErTrPEQ
	sYMoJHEIi5OLMmQSKZM7vGzlS5szCVoAYxCzdiGZZCJEOla8kBgC71+4Nh8CuDbmqpJnBoWZdgw/M
	J7xYVYzQtv4czsNX7r4FDywpo35dD6p9xlt9yTLRTsHtrCmbL7xC/7uyaFodb+AFDbf5ogeoz89/T
	OUo1WgkOaLyqnEZ9EC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYDJ-0000000D6q3-3eZ4;
	Thu, 26 Nov 2026 12:04:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYDF-0000000D6oR-47Dr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:04:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVPNS3277982
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=; b=Nb75BhnkD+24lshd
	TN3D1/aSnF7vHIpkHWwHrM1kKC6YkQu6oDHCxehUDM21hbKbjJyKXraJpSLvlXam
	gnP48d6B48IUH8DyGbf9NtPmsHJPfx1s+Xvo5g4i/6YSn7IKpv0RiuFj1u1B9HCJ
	nrsS14m61D4eNFRt/O9DQMyuIHBNkyiU42V3jRVb+6Xe3JU1uiB2RiZqWOkGZ5t3
	rUyoTCQJYk9dWVXIeVjI5rchYL8/hXkY9Ti0nM78XMS0H/uKHppIWpJQhPXEUnny
	GUDcDdJMJSAEmIBUWh+5vuzpXWLnzh/Y4mOkufX6bT7G9X80VxDZf+8DGg53esvd
	P3Nrtg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8ub8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:04:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso6138801a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795694668; cv=none;
        d=google.com; s=arc-20260327;
        b=b4Vb23kOnL6zwaRorOq6n1qVsNLdG5VVQjYMrgC73uSjQA0i+8vAWuJgVut1p3rCTl
         xUU28vmqIr7YnusfW83JBxPtU8gm+jf1o2Q2Fa2hnjHOQSiYEkDJneLTWaEjpKQ2bQ+e
         BKBS8//H9hNmsUtBSdCy9bDkKMKNwIJBzBFoiBwTi9h+d8ViO7VZ7IwEYcFsR8jIkk3S
         Vr1hGRp0ydEjZvNr9Lm5HlG751hyloUqOtlR9qDhDSpCO/zCzpBtb3GDpONWg1KXV7cH
         f9QWMf9VW/w0zHcy+Ww3QcsnfxlJF5hlZOGij/Qu6B9pAlj1mN0RiT3pHUhf02M40Uvy
         LVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        fh=GWnClkadtPLTj0mfGidCk8PykKK4raBWqvBrg1QIRv8=;
        b=F70SueJnHxuTSUdCLTkaYavf5zzZ7cXtVnUkmRzeF09VriNfv2RLVbfzUyFEGiy9CV
         piDsYLkuYz+he+MeJuSzJxJ9KNISEEttztt8NaM+2R5W1dhiPx/iV2yyRM11dTAQinT6
         gyF+66TIzfT7ieTTnoh27tdbFGk552WREW5h6zrFqy3Llu5Fi8/fYaMNIbYs4qiFULhp
         7TYhmSMA9AWpCHKqunsLmcT2TXA7y8v+T4EH5/umac8iV6Pkns5SnOiQJ0a+1br4K6ty
         dGSpSq0layykBVCwZ09pjiTN/0ZEU39WL/38zXmmwbl7bibvnqTCEQRy7V5H8sOOGqDz
         Fj6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694668; x=1796299468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=kdJAf6OR6M2rmBiR7Y1uTdyCJfj8MXjluvO1AOpIkkL1oTRS3a9FSLSDjselxeOqwF
         VAKFqyi6LOWOC6iTzmuaAiDnTQ9WkvTb9JJKRA9UqPb5x9KmjsWcDS3kv93cLEOAs2OA
         WTdnELS4ntJ1PfySaXTdzZTOKrCQ/xnxup2sfxuW2IhMBP/+O0UHzuPsYOEPG21lWt7R
         2rokgcVtkUoHaNy/7TZoztiecd5iKmOC4z5YMnxb9mRDVEypi1oKYHAOIMkGAy1ftAqi
         7/kQ9677AmDLggenLUK9C4YP0sN+wIgSoI6M3JGdwUG2Qcxyht6P4OGcj9ScyrU0PUxb
         yyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694668; x=1796299468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=KFWZ8jNj2egGD0RqmO3CqhPu+efDkJCwB1Su8j/aLrCCjxXf1pN+NOPWhfDUn/S0h4
         hkRaH9IicqxMXi3/gTrGlltF3OM2iy3WcFU9z9Ta5XNuVkju8Y4A8TLMg7gnqsw8s/78
         oTw+0A0HbrJRrKk49oiPNyG0dyc2DqFXCptkkjaPHkeyUm38dPNWONHabeDws7XxvnKy
         bCbMX98C6ObqXq958WJeOy7tBbpeVUoy9RPCIURdV82sE6Z6y7277tJSjMOt21BRJzup
         Dpj5Iw2AECichsn/eUF7GQqmKZy7zla8Eoq0dFODbbI2bUl/4SEzj89JYcl400lYa/4s
         K0Hg==
X-Forwarded-Encrypted: i=1; AL+hErFqShd2EvqxdBu+SevF7qI6KcX4f3sy3NZvhyI22dp1pvMy2Btrs5XI2KoL3m52VdZLLALBMvSrhqjH5ZriqY8k@lists.infradead.org
X-Gm-Message-State: APuU4Z/iCPLiwKL0u4CvmwPpnkXB9vqPzIxO9zfByp0eYdgXp43LS060
	R6quMG6E8VO95ImFZWm/OYKh4/J1G8qihhS9kwBXswYpjHuCXhgqHQYDaPz2Wo3uQRPp/YC3XSF
	SYOGwweJkQ5IvYNAC3X9mSvj6OT6ATSt1IhlKGK44snsYgZUy+lDuBO9exLqEfVJhwOpnDBI64t
	wfKqvIfGshMmYy/OA1w14FDATDTFEWADWimtHLXKa5ndEOlZtqRuu+vWU6m3njAoY=
X-Gm-Gg: AZFdTZcRK+T5yd+QKy9ldMlx252CG2jm1Eggi01cE+3OuAC/31r2qJI0P6pHfzSG1Tf
	fxgGHqhx208oB0Wm1xJjgoh5W0PkBmZgJJZsV1UDr+YtpPJn6JgiXaH8qasehBIXXqm0rwyfzwW
	Uro9WxY+rys4N/VI8+0ftG7VvWS5UfR7Z23bht3I3f58FrpYzkQYx7oGJTMw==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b41c942d13mr20572872a91.49.1795694667821;
        Thu, 26 Nov 2026 04:04:27 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id
 98e67ed59e1d1-3b41c942d13mr20572850a91.49.1795694667362; Thu, 26 Nov 2026
 04:04:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr> <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:04:16 +0100
X-Gm-Features: Aa3M54pnB9NhEO6Ylxt6lEzs1c2Wp_th_l5IvL7KXYy5McWsZMXy_VANhdE7X6Q
Message-ID: <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RCNorPYu-lTyJBMI70YKlAMbdALujmiD
X-Proofpoint-GUID: RCNorPYu-lTyJBMI70YKlAMbdALujmiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX5eo77rd3qXzf
 pg0W6VZkl+fMiEI9hK5RGtOcFVp4JADD61v3xV3aFXsFU4ZjD7uARIkjZZ54srLMh1zr68kzxvb
 9kLJ2vhlxJ481Q2X1SZS8ffLNIIP//+Dy+KSoqHRIZ/REMer1lZqVvNcJimVHIQXmtM9sku4eno
 SQBoSbeikudgquWdxRxljLYFwBxCyBFQGfmcUFs/vwwD0XiU83BeF0h6GXtdNccrc1QGYosqAjK
 7WgkvOI1wZ46OKvQkGmcVZl/7qMNmKYvIXlr0k4g3DP1cIkLaPLMUxCnAyihqrRIMgCpNjDqQGX
 lHqzqc43RIdpl3cPRG6dssoVu8gbNi7Vsarfrqz8UKuo9XGg1bv5OEVpk/a4swDzIri0zM3P6O2
 XzYOlQOo6vyTT6cuZorYJNLz1pwdMJEzqE2SSwg8ZQ2TbbQIska+SyO75+kQ4YOxgbjMCkDy12i
 vKBQ8Rc2MbS1n7ZhQuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX6P9Kn4jm5QyL
 HFvOlbjXg9hqyUx+rTZ+A4ojr0M9lXEMxF5SMifxzP8M/LHru9fmqFfwZ4qCMg3HT7s3+09W2tM
 bEjWzR4w63RX78VVRDOG9DdegC69PTA=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08204c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=zH7TnIvAWWhA1n-d4cAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_040430_164194_7E9501D2 
X-CRM114-Status: GOOD (  29.87  )
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

On Mon, Nov 23, 2026 at 8:38=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> When a power domain is found already powered on at probe time (typically
> the VPU domain left enabled by the bootloader), the driver registers the
> genpd in the ON state with GENPD_FLAG_ALWAYS_ON and never calls
> meson_ee_pwrc_on(). As a result, the memory power-down bits of the domain
> are not touched.
>
> pwrc_ee_is_powered_off() only checks the top-level sleep bit, so a
> bootloader that enabled the VPU without waking every memory block
> leaves those memories powered down, and nothing in the genpd framework
> will wake them since pm_runtime_resume_and_get() is a no-op for an
> always-on domain.
>
> This is a preparatory change: a following patch drops the explicit
> HHI_MEM_PD_REG0 write from the meson_dw_hdmi driver, which relies on the
> power domain to power the HDMITX memory.

A question, is the target to drop the GENPD_FLAG_ALWAYS_ON bit for
these PM domains, once the consumer drivers have received proper
support for runtime PM?

In any case, this looks good to me! Do you want me to apply this via
my pmdomain tree?

Kind regards
Uffe

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/=
amlogic/meson-ee-pwrc.c
> index 338f70d77bf0..b3ae5cd7bea8 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -392,11 +392,21 @@ static int meson_ee_pwrc_off(struct generic_pm_doma=
in *domain)
>         return 0;
>  }
>
> +static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < dom->desc.mem_pd_count; i++)
> +               regmap_update_bits(dom->pwrc->regmap_hhi,
> +                                  dom->desc.mem_pd[i].reg,
> +                                  dom->desc.mem_pd[i].mask, 0);
> +}
> +
>  static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
>  {
>         struct meson_ee_pwrc_domain *pwrc_domain =3D
>                 container_of(domain, struct meson_ee_pwrc_domain, base);
> -       int i, ret;
> +       int ret;
>
>         if (pwrc_domain->desc.top_pd)
>                 regmap_update_bits(pwrc_domain->pwrc->regmap_ao,
> @@ -404,10 +414,7 @@ static int meson_ee_pwrc_on(struct generic_pm_domain=
 *domain)
>                                    pwrc_domain->desc.top_pd->sleep_mask, =
0);
>         udelay(20);
>
> -       for (i =3D 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
> -               regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
> -                                  pwrc_domain->desc.mem_pd[i].reg,
> -                                  pwrc_domain->desc.mem_pd[i].mask, 0);
> +       meson_ee_pwrc_mem_power_up(pwrc_domain);
>
>         udelay(20);
>
> @@ -478,6 +485,8 @@ static int meson_ee_pwrc_init_domain(struct platform_=
device *pdev,
>           * prepare/enable counters won't be in sync.
>           */
>         if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_po=
wered_off(dom)) {
> +               meson_ee_pwrc_mem_power_up(dom);
> +
>                 ret =3D clk_bulk_prepare_enable(dom->num_clks, dom->clks)=
;
>                 if (ret)
>                         return ret;
>
> --
> 2.56.1
>
>

