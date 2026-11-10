Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dt0GJUhN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VcKBDgWF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxLXvCJDPTiU3idAYNxvh3COzhc7dqANDF/b6/PgY0o=; b=Dt0GJUhN9LYvTpImLNTOPZ1YGn
	QVOmZ1yLwzM82XKIq2EL+Bn3RuPGJgF2ArliwNmScL+E4ggWA8WyTNwimM9aJ/dnkj4YMeUGHgJgn
	m+OILMAAolXm/GMxxRmnuo50zsNdRulH/KS3ejYPZ8De8cWuLtuakHow6WjAnEHnTE6fSRUV2uacY
	QzvSNLg4ug2lDHL7o4uuWp3KBfz975hTyBi/jgJQT7PUoz2ZA2XMaXj1rtngkBKkWCSOuyqS6YoMS
	udkV88cPLJ0qTyzQpF3RX8MggegP4fVGHObT+Vu8lxtkJgIzG7ZbaOV6FrVi528murK0dL0eQKRjA
	QuLsj2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjg3-00000003ZaN-2rF0;
	Tue, 10 Nov 2026 11:06:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjeF-00000003ZI0-2mN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:04:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730C31BC0;
	Tue, 10 Nov 2026 03:04:15 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80DDD3F632;
	Tue, 10 Nov 2026 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794308658; bh=PV8kYHLTSqhDayRyWOJiOaViLS2lBYzQkhuKwTVoj1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcKBDgWFZHDpBmUxcHG/edDP82p6nv5SMsS3gBAaj4Kwg7FvOkiEFUq12Rx60LsiY
	 7GWnmDmhzhv9sPRZ256YUGS4p1w1uUwpV+spDdiqBCn5YLtFTiiEx/Rr4emX3Xm/gi
	 xmOq2kPwAIghEOrtddgGSvBFtq1RITe2iFem46Ys=
Date: Tue, 10 Nov 2026 11:04:13 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
Message-ID: <avL6LUopS94jB6Ja@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_030421_279641_8A784B54 
X-CRM114-Status: GOOD (  14.16  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 30, 2026 at 04:58:33PM +0100, Clément Le Goffic wrote:
> PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
> the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
> INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
> INPUT_SCHMITT and refuse the threshold, the protocol has no type for
> it.
> 

> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

>  drivers/pinctrl/pinctrl-scmi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 6bc94c68e89a..5de47e060e8c 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
>  	case PIN_CONFIG_INPUT_ENABLE:
>  		*type = SCMI_PIN_INPUT_MODE;
>  		break;
> -	case PIN_CONFIG_INPUT_SCHMITT:
> -		*type = SCMI_PIN_INPUT_SCHMITT;
> -		break;
>  	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -		*type = SCMI_PIN_INPUT_MODE;
> +		*type = SCMI_PIN_INPUT_SCHMITT;
>  		break;
>  	case PIN_CONFIG_MODE_LOW_POWER:
>  		*type = SCMI_PIN_LOW_POWER_MODE;
> 
> -- 
> 2.56.0
> 

