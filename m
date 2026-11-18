Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D7606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ne0JQ8IB;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IM4vBm4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=; b=Ne0JQ8IBT/uH6d
	H+qNtv1AwlAeyMhN58nkIhYk1clRVBgETdL108jHualN+yr4QAnd8iQmfSAiG6fmwYFNCs+H+xTwF
	0+PyYrym1ySFc1ZxkImUT2spb1MyzO8jrNAYZ/oHSU7/i4P5iqK2ekxnTb8iUOBC598RZMvANeiFX
	yp3PhcYTMxuk11oh9sckfSEYYTxOTME+8Jv8NsWs4YxYFYfwJOwMXCYPJANi7lR2p1Actf/uviaWa
	m4LpWua+xjtHHRffAGwxbUyWh8tiGplFjU4TljL3jaHo3HacU0awiPqD9OkI4ioYMXsIzKAjuvCdL
	2Oj+LWk1FHgc2k0cFiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelo-00000008qQH-0XvM;
	Wed, 18 Nov 2026 12:28:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelj-00000008qNQ-3AOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:28:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso732720f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004885; x=1795609685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=IM4vBm4rRGv17TAMMp3rzdguAoeGPnjStIkS1QepU7hyK9xuGEMMLU/VvW7+6pI78l
         MTcCacLEdqkbLJsuqahchJz+16YF1oURquaf4Yp3csGgYOYn2/0FTzFka4bCQZCzooE7
         Zr+1kxym51G/hE6mPOHIAf8oIw9SSQjf2pgctlfpGhOayfjX6DrJtKpTkvU4yax0YFrC
         SoP5reH8g/NBkTP2CVlQlSqxRDlU8rVN9BpW0sX4yygtRIIQGsP2/twPdPAF/naImz5T
         rkzdtjI/gGbaRPyDPp6QkM7W03InmOaJKovLACWR6vd1FNO7VEMFCPB+mPjQBWcbpPiJ
         o90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004885; x=1795609685;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=zEwknSRQz987sYEUBpzOkUpJvkl/Q3f52+1zFZj1bsdM+C+PLxHOn9MgAW3QR7dHTZ
         KH03IlQlFKa519mTNqC5ds9zuSHirEuHUlw3FzYX6fFfu0S/zRA5+I8I1ySVV9T+qSTg
         HFd83/xdk5ttKDteRwM42qcmmLIA7PR7vVBU2BOapIswFlVUG8C7UiEsReA2WJ7OZzZ4
         7mSLQ9JQ9xlvTR/jdqvYQb5s3EV4O02/GPirnn9PYt8KwFCRPnm8X+zUhn4Rt5on7cgB
         0fBZpVMEnCBGP+20NtDgQBhVUaizrMV/5/2lFa6AXAGwqBS6mlL9p5+GShIzvhY0ITd3
         4Fbw==
X-Forwarded-Encrypted: i=1; AL+hErG7HE2aBFKja+e57FFENgtoCbHQUYBzjuwI2DbF8xkAhOE1ygftpEV/eznJdNzf0JU0KRjQxLyimg961RYknfo7@lists.infradead.org
X-Gm-Message-State: APuU4Z+I6kutYhvFAGKimwOdSoM59oGgcEbp2MUSLm2zMhIJSmyBsR9y
	MdrT7Ec7zbpDx2lLNRbUC9ZSWgRNGDEEXGDynKBOlQgU7J9OjjBQMbXJGrAHNdBWbCQ=
X-Gm-Gg: AZFdTZdeH8FetjFZhZocNxGvvV/OuYwmH+peqf6wmQ9JM5EnJhHRkAjTptl9xifWBsI
	JWZ4okofgJi/dH1q3HGgw/gbm2aX7VOs6wTurpYkC9eYlcHzLDOD07gJxXph30UUIrrW0iwpH2G
	llbHS9WAKfR74Qbv4mTA12mOHvP4nf8yENohv8Z5idQmkl849lGWNVdYBJFlwvOrCOF44FQbayn
	IXvDP/yT2czzc8tWOxx5eVgXQve+kgIVnKKHZxJ/sJjOx4as9Mof1vAvGpaE/QUa0L9qO/AzeYQ
	87UrrtWV10whlzp8xOH6HBq2z6GjP74W9NB90OLKlXU4RRMOUUKjA3RD2rFY19B0JnHfTdl8dJn
	pdQwJA6hxlMSVp0Or4FRBzyPPlHCPvw2pPL0rjC41xGJPFxIi4YewGAuupQvlmEJq4gswI6S2qb
	QOZj7PZBmdM76XYqsHyOIUAeIyoamua5qB03aIVRCnzZI+EZmndk8Q6eu5IlCwourAS7TC5Nup0
	BP6qlYgrMxbj7ea9ulLuXPYNqVUU3RcjpUiSdmUWiXYsqD30ZXvPVIKto6d5BQE2QIAYKrEbMpH
	7pWsMiNVkIPM8GyIrKjw1zjYI2dQ+aRiELn81IxsQrkQaYrigUFdmgkZ5YakNdGP7/y7it4lChz
	yOw==
X-Received: by 2002:a05:6000:2608:b0:4a6:8012:198 with SMTP id ffacd0b85a97d-4a6801202dbmr3938687f8f.31.1795004885474;
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4011448f8f.12.2026.11.18.04.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Message-ID: <c5068359-e155-4374-9f3a-1b89106c6fb4@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 09/12] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042807_830854_59DC7708 
X-CRM114-Status: GOOD (  15.01  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> # Conflicts:
> #	drivers/accel/rocket/rocket_core.c
> #	drivers/accel/rocket/rocket_core.h

This needs to be removed from the commit message.


> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index db137e2ec15e..868af86d00ce 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  
>  #include "rocket_device.h"
> +#include "rocket_drv.h"
>  
>  struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  					 const struct drm_driver *rocket_drm_driver)
> @@ -27,7 +28,7 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  	ddev = &rdev->ddev;
>  	dev_set_drvdata(dev, rdev);
>  
> -	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +	for_each_matching_node(core_node, rocket_dt_match)
>  		if (of_device_is_available(core_node))
>  			num_cores++;

I think it would be a little cleaner to do the counting in rocket_drv.c,
and pass it in as a parameter to rocket_device_init().
Then you don't need to share the dt_match over two files.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 68df1596014e..59a6f548e108 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -31,6 +31,11 @@
>  /* Bits 3:0 of PC_BASE_ADDRESS hold the mode selection bit and reserved bits */
>  #define ROCKET_REGCMD_ALIGN	16
>  
> +#define RK3576_PC_TASK_CON_TASK_NUMBER(n)	((n) & 0xffff)
> +#define RK3576_PC_TASK_CON_PP_EN		BIT(16)
> +#define RK3576_PC_TASK_CON_COUNT_CLEAR		BIT(17)
> +#define RK3576_PC_TASK_CON_LAST_LAYER_CLEAR	BIT(18)

This introduces an inconsistency in the way registers are handled. All
other reg definitions are in rocket_registers.h (originating from mesa
xml) but this one is placed here.

I think you should add it to mesa as some kind of register variant, and
then regenerate rocket_registers.h


