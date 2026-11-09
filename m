Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5838606D814
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ac3in5ay;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SMrygNrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=; b=Ac3in5ayGjgxox
	KdgAGF4g/jx60ugQzgpM+bPLJsguNVcO04FMAnxvSHCC8wjipnVIKUs0eIugXRDy7EBIp6ENG7Gl/
	KxZLAvddH978jUVt/JCeMXYtvDSMhTh2T7AFlHaPG+rLkEHsp0gjk6dhgPgqWqdE9HrV43iURy3oL
	4+eZbizvXiZYPqWyTyU5kBJtYvOCAfhSLRzS13cNJkQ0d++tVJMbOKajIjrjl2xgzKULzAk8eJobJ
	Y/cL3f30DicjDhJ2r9ugQqHBGYAM2Z0odR6HVHjZxtCPMfThzjiTIShZyfLzA76/X7FB7gRcGH/JP
	8JRavQwlC7Be04ymzlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwW-00000000aCV-2p2Y;
	Mon, 09 Nov 2026 11:53:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwN-00000000a9Q-14nF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:53:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490f38e9688so615260f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225213; x=1794830013; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=SMrygNrj19tfUpynqs9BeL/ToVRp7t6kycGATebrzdpREhRIphfHsDWg+l/MGnl4p3
         fyd0cNTqqoS4xd0QTKMw4JGQcEe5C7anTWKgLjK2xpXb8U4heDSrpNx8fL2bAOhOd+Sr
         jIdXPNnGTiguY85n6il/83TH3YaD7p6unNo6te4B7H3m9IOzUokrHQlkvLdNzUFg1g7D
         QiPAvYhgV0Gy9zlj/UmmIId6SmwqJHpssbR5tqvt72GqHHGE3AXOYm1SXG8kfaaovszA
         xRYBxwmm8OcdIW5eI7GUcQ7tAkCz/23wqr2I5keXZ+AJcKcX/lBfvYFz+Ss/38dXNq6B
         mhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225213; x=1794830013;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=sebpiiRh5KWM3ekIvRU3t/2xmGH8NuE7XpfS2H2gDWfQQVpNmLgIBPOMqKWYkBSxWh
         W4FSRqJw74HRQwjLiMoE6y90RE/S0Dw8pzybDkWs8sZ/LCLfcrrIeLZsMKCm9jCaTHZ9
         n4YqsFzIiR8lOXpOrVmdYt0V0RCb4vouKKyBdijfD4lDK18+sPbKb2OG0fvd6B5y/x1s
         10HULhKD9mlsef5c2yEKdnuIxXw8/cr/ffiRMc9SRmkECDcbLZYy6XX7fI9A5+nbns43
         uk576e+19ITaLd1PpVll9fJsFQcKUXkiRYDGPOhDpVND84u0OzKWjHCjkpht5u0PvGCi
         HAKQ==
X-Gm-Message-State: APuU4Z+KMrDWwtEx8Z/UJbUop+Nvl+Pzg7X9qdXVnzdXCSnCg5+OfP85
	6sDvNQBR6sBRI+TpttadAeSmyLH1dKCxtO9KRC8AI4FdzanIoKJxh+aDkBN5hPzcCfU=
X-Gm-Gg: AYBFou3GAEDXvARvdGJ7Z4nqHIIsPzB0cgQvEygwg+mtZovy5UmZmnorxTQOTxMnPXK
	Lcf1VjcWjlE5z9A0ftKTISxMpTQL7YA6eZS+mJ3WbDqizE4kTFeLww1y0ZtA89RAakLRoL5aXOd
	KsQ9Ttv1kDcrNQvP3/DWCEkuMtaRWExDXW+fQNFzOWipFtywJTd1K65JX05+anxLMK5Sts82wAw
	RtK8LwoJYZtkWXcDO3fHxAxXefFGnjjEzVSlSRUKkgBhv1W0ZDGqCMYs7s2PAo8BpviMr9ZUDCx
	2wujK4H1hBfDnesSFXOnuPW5E8neL8RGwBOPEXzKRwflJDQJh+QIScUgg8qIR/6DB7ZoMqVQS6I
	34Pp/SCXmCpmE8AsHZsSCJ4s7NSRE41Z0GMSAHq3Rs3NLOXumyLEP2RtShXppZ8BGQNPuIiQHeY
	l0NPeVKfLz2xV17aFLmSFV/miHAiHgAz+l334MiUKhCn1a7PEWaJW8egAHlDhVGu/0wIgmRGqNv
	Y4t1WDRD0Y+5xAF+tqGkFBwd5DWiWv/KkXvCDyDHVjwTF4hWbkhLqw/O3JJMPYfP02nGlJcZxMi
	tYjYmCXzC2lk9wU/gxxkz/OOYCrY1jfIfTcK+Ic1WxA=
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr14507820f8f.30.1794225213002;
        Mon, 09 Nov 2026 03:53:33 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth
 HDMI DTDs
Message-Id: <179422521194.1645559.1387055395684042369.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_035335_324927_0A8F4696 
X-CRM114-Status: UNSURE (   8.01  )
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

On Mon, 02 Nov 2026 22:28:43 +0100, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>   DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                Hfront   80 Hsync  32 Hback   48 Hpol P
>                Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: add support for higher bandwidth HDMI DTDs
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a5b5f29926498782f60441298e8a5442cd6a36cb

-- 
Neil


