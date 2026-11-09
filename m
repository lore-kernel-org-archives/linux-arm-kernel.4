Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D6606D829
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3L94shhM;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lrkur7NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=; b=3L94shhMJBbOlc
	zpxvTjCrbaKYc6toET4kqYTAfE6fTmbiuOmjZ9O36SSVaH7vSWusC0FbJa143t/ffUJ3xtQi8x/hj
	ZGbxiACjg3ev3giclNZiZkagKyzPcPb/xscl/NU5EGk+4hCRXHjCfVDYjDyTf9zzGuF+Zb2oVSRzc
	Mo//P0f6k/bWNjsOVInADzVZqIRHjFltGlagZ4xHm/zcc/r5MViF4Kh2jGB2KdXJMwjWkIkQKccOb
	q05lci9FtPV3FAaAwSAzVz77bd7faDsjfrZXuI3m9wt3Q9cytIhMn+kt+ck7BwQcOyyvmvmLO9xoU
	RLtZmcPFdvskN9YbR5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwQ-00000000aAl-1qmJ;
	Mon, 09 Nov 2026 11:53:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwM-00000000a9G-3fHf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:53:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5044045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225212; x=1794830012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=Lrkur7NNlPEWR+4rleQFXwQZ4YDEBqBvrKeDvBybADhTKnXMQmYejJ/peIxhljSrwu
         3SsdGkG7hFFzj0Iw8oKt8qWEgSMDTQLbtRllYXdZcos6wHY8KOerWlEoije1bqWEkwr3
         90wNiJPuQDWtBE1MO+Y0BKdcthsumlvbVacLGZMi6EB9E/Uo5SVfvtMOGrC4AiFa6DP1
         4eooUyD/05MNoi/AvKgXr9rNcBTeCfQ6jHwE3V8p0WfT0KS+1AdFBSlh3Sh5ZxHQXrSL
         TqV+WbleoNmN/IJApQfEEpmRqaOA6iXmt8LmuneWO25KbkV4xf2HOEWoH1p/k5M+DQ21
         geKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225212; x=1794830012;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLTgbg+UpD4d4gieUiuEMrVcZ8oV4X6SKoeOC1j2dCA=;
        b=ZX2A8gx4F7mOdfLTaV8L9EMe5V78TKdQJVyOcwlhR43s4nD8buMmaGk6RHbIQFRAo8
         oDrqZfjuiGGcRF0dMMNtqB3F1CvvGCMJNC06Ca1wANZKqkSf/X69sXHI9Emdy5yEVOxI
         2OqPdXXOfu6Cmi/l8euCUiGo+SkX8qTAcVpTnjhaG2pSobwhHGY9Ld0M0zul8AMw/Rux
         zuyQbz7qSpXQpArawPSN67rnO0FTSnBZ3j8951W08H0xPYNlRm8+PjicyguytKWQKoJH
         AZRhcQv4LMDcwZM6/IQCXjSw8Z4PJFKWaTEhmRctTerjlHrQDvA+lUwqVARXstVhE1rF
         6iSQ==
X-Forwarded-Encrypted: i=1; AL+hErFkOf5u4qC41wCZU0dC89EffgoVaSWD6DfPLzyDnYx/R7wSBZlHWkbB0xxmYojhWUst1e3rkPwWTGmTpYi2F+/q@lists.infradead.org
X-Gm-Message-State: APuU4Z+HZoCxRz3Lr2vqP/XRl6o++M6gObsX0RYkswpsCiZuL55U7Phm
	F7f+37jeR5DZyqr31qlgjzZKFZStEbiq206zje7PA1O7Gec2cg1mztFaXOyz47uW/5A=
X-Gm-Gg: AYBFou2VkVbqkQp7pfRt+/zV3gV3FmLm9b0/cMAjws+D0xhnAPRMN2/OurgOPFidvW8
	CN9YhYIeO07BQkjc6MGk6ectPkjGGCO9shTROL/3qMKxq6BjwtcQqc2wfQ2TZi+L1jotk8o3UL7
	TtJk8ZrXURed3US5iSVV9YsdJGlsy5Fd24Hbi6QYY67a35d4xUSEYa0q//29sA07XAwlF5Zo/E/
	ZJ9EdbqHsLOgLeKBEtn5Ixxk2PBWcsiGeqcnmv4Fk+pN+EhOWJuOn9xxq01TzmWvcKmLTiA9oVX
	1u1xvIRsPo6we6gmQMn1hjRRrPJOcWcg9IYaSJkISDfPztxFrXkoB/g35SM4KwLXnsCKnvPsaQ9
	zZfyDO8GwGFA5ikhpZCfUBj4wHuijF0wO+tFQ0c5gwkRrMFvbddamxIcJo42vNY/bWIY+Sa92K3
	1g5qzCutFznEMqBhYWDjob0LWH16KXvOO6m3BpV+Dighk04wlrdiyFocoiNUDsTHze6sy7Ai1dc
	9TblboMuBWuvAjcjlZ8NlXbuYRzzNFDUKckfFsi/hNEEFeMaacB13epBr7j6UgHxv/Z/AucPLSK
	OnVNZgEa/i7PGfpeR1RurFhX5e0oiSxtf5lDqF+QDIo=
X-Received: by 2002:a05:600c:4f42:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4b963c7ceccmr86905045e9.25.1794225211847;
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jose Nieto <jnieto.alaber@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
Message-Id: <179422521075.1645559.4574757378913663782.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_035334_964378_FC20654B 
X-CRM114-Status: UNSURE (   8.12  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed, 04 Nov 2026 16:51:19 +0100, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>   [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>   blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: plane: add pixel blend mode property
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f001f3ff2e0a81b934e7b14cf7a695ea668494a6

-- 
Neil


