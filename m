Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wL1ilrR;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HspPv9gR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=; b=0wL1ilrRGatCuA
	xZzsd42vlfAsYi3+3rqYPzSAhh7B54ySLIQQrriK+FAG9c6ZRm/fFOQAdmRaWQKzNpmmDXPjm+A+5
	jhfC9tcev/1aZl2WZrhdJYTSeONjEdaZXv6a0rg0DlKBUcQKD1qdHxvVuyl2UCRgy3iN3fGIiUSsd
	qJuWN4Pm2mAWImBsexTKxHY2SjWbV4jspPe/DL/UT2i2AHS74sN5r8+AzQk3WnrLguElPtzXEvQEw
	hYgY0IeMsTOFIsyX6dkJYEYkC3Z8IsbdUHriJs9ROpw42w6wsc7+Wbktj1vH1Z9NmyMicvtsvkZy0
	myrc6ePMbNeS5KK/7B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTem0-00000008qa8-1IG3;
	Wed, 18 Nov 2026 12:28:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTelu-00000008qTI-17eU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:28:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so9391055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004896; x=1795609696; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=HspPv9gRoTZpVMVwQMygkdidqgisQM/oCfvEW38ZpIx6FSn8qOr5MFARxu9mnH3aS6
         4JU4JzUmYWpYRuaIspsGoI1wWHdWxV2uw8EX5g52ZhqS0nUZOrLWAMlToaNa/X2bbeRs
         1GxWvIomcyv+6irgZUQC5HpS5LXFfVoWNrDAKTYRbGHlKdZMEtTISAIUMEWLllmUSvrD
         SMAIKAovkAoaALm5ftCYII3EJcAmrvRtJSIRpq7F4h9m599ijh9n3wR7T0zTQb0lSjNU
         oLrOLrMCOAode4PNpy+kU/wRNVO6IJ677c3gBtglQvMQemnhwsh1K7hqJgU4KTw68ptL
         6n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004896; x=1795609696;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=UJFBedb5pR79BCFe9eUIGDwbjERorFp8LwnqkXku9IlftWh7KTUMOWs7U3hkNF5x7d
         uzdKYMGLn1SEO8qNYnQBOWUNn1G20FM+9Od2LmOGTonLKjYWsO5UqDqmQMoENtl0dWb7
         vyXtgDEy8ni5Qvbt02lv1lOzxn99T0EVnuAqTmofMSmtV/uypUf6v/w04B1HLgqDxbPj
         N77cYMmsSGf1CKOevF1SMLh/5b9W60o09sil0iufnDuG+wCvZpcevnbDe+o5QEtYqH8L
         EG7uNbSXTBkLER75M8wXPb6BJMXHsiTGxTL8b+NupVWDhon+jd/qqBPwD6emJLowtINh
         nW7w==
X-Forwarded-Encrypted: i=1; AL+hErH9GCUEDAWnGMlzhJANOIS6E96jy4wPbRDpqt4BrQsTqUA3iP2qejZigSaLLCk+iiRJFYBW69owOsTYjpB4U7wo@lists.infradead.org
X-Gm-Message-State: APuU4Z+/kaYf0mxjKMCQ1ZAoqW+pqN2kZMCN+50FLMBXSOSECTzsNpEy
	XPMKHm8TphicLh71oHClO/wN5w3G0VlKSPSD2PawDe1m4KBzJy9AriL437L7NEqxQDc=
X-Gm-Gg: AYBFou0fwvpbESiBL27nqizSekcMPPDiFp7ZzpYUkfmePhUeK8iXUWlqehz4UPfr0Kq
	YONZ8/i1mk+E80hAxpZfceeYekClr5SRqM869LU9rZcolIc4pmO3OvWi39lIFYC+PV2EKREwB9r
	mdHwdljn3jmvskKcLwuZCd3VpECEnfxbW3bPajRGcvHJYbJ6fTVEJb4ZZq12wPdlwXKX3P3EzuG
	IQAfJzE49Uhm0qguejUMNtHtPkD0/mVPkzqtoveIobJM5cPfqU8SbNhQUZK02iE+WVLz5Gpyj6T
	gsB+QAYZOHhOxmUYmwDMfWMZrgBSubUSc6Bb61byxaAn2KOwCwwPcqeau318vtGkjYlywCATHeC
	3B8PE18/wqydCTj+AfrrKg07z0t0IjHaR5TJmlm/63ZS8VBUPazDmPLOTq2eewTJfQLXc7Zl8Bf
	5rUcC916liNix84vSoBXt34OaaUxJJn01FwEdzfBFIppZE39fmrUUFdQ9W5y4FV7WGxTjY4LYkY
	fTz/T9CrzJ3GefmxR1PlFJVMU+PxLyOvne5nBJLiGXAaOU/j2cubHlbDoYw7tr0Q9J4oxN/0bg/
	L9y4OpdQt73VIflGvcXfSwtc3GWfS9T5IJ0+mJTJBm3gbWPbHWVM1F7pn/tDt+4YySXoIj7yInH
	iTw==
X-Received: by 2002:a05:600c:8b63:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb7da27fd2mr44906275e9.23.1795004896063;
        Wed, 18 Nov 2026 04:28:16 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm64858355e9.7.2026.11.18.04.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:15 -0800 (PST)
Message-ID: <6291be5c-94e8-4a5b-aa30-f797672e4165@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 10/12] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
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
 <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042818_335713_81D79F3A 
X-CRM114-Status: GOOD (  22.47  )
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
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can query the NPU
> hardware version and pick the matching hardware description, such as the
> SRAM configuration and the register layout.
> 
> Add DRM_ROCKET_PARAM_HW_VERSION, which returns a hardware version enum
> that matches the device tree compatible.
> 
> The enum starts at 1 and 0 is not used:
> 
>   RK3588: 1
>   RK3576: 2

I wonder if REG_PC_VERSION / REG_PC_VERSION_NUM could be used instead of
creating our own numbering scheme?

> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> index ef7043046bc6..50c8b05bd394 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -41,6 +41,7 @@ struct rocket_soc_data {
>  	unsigned int num_clks;
>  	unsigned int num_resets;
>  	bool task_con_16bit;
> +	u32 hw_version;
>  };


If we're adding hw_version here then perhaps the task_con register
selection could be made based on the hw_version field value. Then we
don't need an extra flag.

> +static int
> +rocket_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_rocket_get_param *args = data;
> +	const struct rocket_soc_data *soc;
> +
> +	if (args->reserved != 0) {
> +		drm_dbg(dev, "Reserved field in drm_rocket_get_param struct should be 0.\n");
> +		return -EINVAL;
> +	}
> +
> +	soc = READ_ONCE(rdev->cores[0].soc);

Does it make sense to do READ_ONCE if the variable was not written with
WRITE_ONCE?

If my quick read of commits like 89c2c777df17 is correct, it's possible
that there are gaps anywhere in the cores[] list; please double check if
it's safe to always assume core 0 exists.

> +/**
> + * enum drm_rocket_param - parameters for DRM_IOCTL_ROCKET_GET_PARAM
> + * @DRM_ROCKET_PARAM_HW_VERSION: an enum drm_rocket_hw_version value.
> + */
> +enum drm_rocket_param {
> +	DRM_ROCKET_PARAM_HW_VERSION = 0,
> +};
> +
> +/**
> + * enum drm_rocket_hw_version - the NPU, one value per DT compatible
> + * @DRM_ROCKET_HW_RK3588: "rockchip,rk3588-rknn-core"
> + * @DRM_ROCKET_HW_RK3576: "rockchip,rk3576-rknn-core"
> + */

Let's not document these as a match against compatible and their values,
just state it as a way of identifying the NPU chipset.

