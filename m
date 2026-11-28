Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lud+SFrh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N87QFKwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=; b=lud+SFrhXbrejF
	jRZ1sAIhRZ48zD6cUbWANDTiJfQ+ZPr7D7oiswlv7xBBGk3Azvik2d/ms8b4kSjycHja43tIZAsIg
	38YHWn68Y08nT3HfyE2MnHBMlw4RkL/p6DeqOJB/OLT9Ca8M/gFj92fOc6bLsHzc1kFD+BOMc7aJX
	TU1H3H9J6o+NK1N+3osUwHx+jiCeRQxlvThNuvNpEppQRySz+5+P3tkWDvwl9XJ7BBfbAvsnbu7ZJ
	Cacw6wYB28FY6LrVmHb8MuL11RUjLn1yF6rFHohvK0ypx/dVYkCCcz7P54AjxVlvUubf03ZoJc2ON
	TgbeN28JFdHjRSpXAWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDdz-00000000WQ2-1yaz;
	Sat, 28 Nov 2026 08:18:54 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDdt-00000000WPR-1Y7L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 08:18:48 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1ae58d17cd9so10127608c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853924; x=1796458724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=N87QFKwmeu76Asag8d0FtKNTVAK66AbKqyhBW0pY8YzopbyXaI8oQlY5JP7VtKTJCE
         rR8uHZMRJSJpbZi88KQRXypmvELCUw9Y4elkUB/QNzyjAOjoUY+g4h0ScWEFP3jM00s2
         EvdXA2JD3Zu3I1MWcnPSq6xaoIQMnhRwHkh5zrfbuhT7cxSChLbjIv4rgaNX/L+Smsdl
         S/8REhfBpEoYr3Zd9jx0OnuaIbZOzKQpghdhQliTKJXO/5NDFZbDjfQpiAMkOV05uoX9
         hrLXmdcV3taza2A53ZbBMfp3MU0RhiXmu4lxNTlJZl5v+Kg1M1eAqJt46cuLShm4CHLH
         Vg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853924; x=1796458724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=VibD78ZjjkIGmv9DhI6GCOUMScn/4TLI8uGbfrftBw5H7YK2uooIGoIByEp02f1VCG
         i2cS7Ihf2T0cKMBSG2osmU1O+S3uZAUyN7SUFSSNI1OcATBjmjvZFDuouOl6HqilXE5v
         XeU1TLBy+YF02+AJq051db1sNJDR8BbM1Qrt1z1d5iH4XnZ5e2cxyDvoqIPW8XLak01V
         5K+apD0TBvAhZO5lJGxuSgcGzod5NccRobkWjaaU5HMbxyrfMej3LDX9DnpsODEHDg7m
         Oic0492po2fWfKZwisFXeIUOYpV7yQX2fhf25zMpv3M7MMPvk5rYjsyuzNYawBfE76sk
         VDgA==
X-Forwarded-Encrypted: i=1; AL+hErHrHQmr9Wj5M1nhc208go59gLAVU9yaXr4LskyUcGR2eM4ogHYHg+qFKHSYVQuN5YQO6FW5tahkgX4yCfzabfHX@lists.infradead.org
X-Gm-Message-State: APuU4Z/uO/yv1hItqN4cfDpRHX+Lq9JR/4QzfD6n/r0b2+Qo9YPVuNXe
	7ARIUyGcH4R3xZXac4reDgIlrlcMEMfFHS6fU8qhQVKsOZlo4Q6QB7Ar
X-Gm-Gg: AZFdTZdLM6KcKGu/ffCwCHWm3RPBPW7+nkNh3500U4hjObKr5LbYEjJm/juuRyHaVv3
	AL+O5lDQ4fZA+1yOB6/7uad7BLiMBBgGtsWVpuyqNkxWo7wHudG7DofLC5rxUqILosOawI0EsBU
	BDV749UakNlvK6e9fzPuSEdHVhM/sIfpUkH21TdEWQK5PZlyMgp97N+HQA6HwW3s68473OAyqtF
	ZTYnQT+F04RRJEGeehHszUGisqPyy3Utx/KeZyOa5XQytdAGB4jgAsXqr6e4V2Zgem7AfdZTdos
	V7t6EeGtt4TMTRO4V5rLmb5SLOsppqYcjnFdRBFYqwUiwUjk7Zwr7uFeWuck+P1QOY4f7yTeKJA
	SJj/WMDSTZ36LgKB+Myz//goU29/+FnUjrhe/j37BoVdWJwgHWj1GYiZBlsejBuPOsggYkmVO5q
	zifXI1blc+ubWitPh7UtP9pHbwb3OFxCj+FSs2khW9om8+ChClhWxWw1eFYENLsUrXvcSqKEvNb
	CpY9EVTVQK7x/aBP0XLp4TRjoaz9dU2E+UHe4xsyGTEerXlv8LvKwLYgsBO6iPIVZ8nG3gyAmk+
	xW5cAa1vGt8HlrVWE9/1adN1iL/HYcU7AeQXZfEm0prEuxvDTeujTRJi7mbEEpJieD6URkqCpA=
	=
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr33965980c88.10.1795853924289;
        Sat, 28 Nov 2026 00:18:44 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm55344948c88.4.2026.11.28.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	nicolas.ferre@microchip.com,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: atmel: ac97c: fix reset GPIO error handling
Date: Sat, 28 Nov 2026 08:18:17 +0000
Message-ID: <20261128081817.3132-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <878q2emazw.wl-tiwai@suse.de>
References: <878q2emazw.wl-tiwai@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_001845_410976_B9363F98 
X-CRM114-Status: UNSURE (   5.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

