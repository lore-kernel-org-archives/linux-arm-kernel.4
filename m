Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUm5unJW;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kdK1LuBo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=; b=LUm5unJWSYyJgd
	rVZG2ACJpvH5m2qLErVq5tm0xZODrtc4MspJ3Xntxn4vGyyOEeyDYkKhImpgHqR2of6DEoUQyVAj5
	biZWw/Y+LZLLc82sr+ltkGvnmezj2BPCkFtviTyZfsmpzdKnT5dU3FPuyjTp/w4ldCNfd1b5WZZKa
	D4h0f3p3dn9mdcilNyMyTTtc5m/Z4sfTxihToswMs2wu2/tLuCFaNAb2HaJSDeMkFu6fh1sEbWy6C
	NfswPVl/rvWqif5O40vpMLkOoQ4+C8GiIwJOJ3ektdslk9wr6cLgbx/QmOb4wr1+RMg2WdGu4vINN
	OSkAGONEqeRBWLBtsBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKed-000000002jZ-2YSr;
	Mon, 09 Nov 2026 08:23:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKeX-000000002iE-3kUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:23:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4267755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794212575; x=1794817375; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=kdK1LuBoJEIkPFFuZVhmMtL2hl67TLwowXmkK8eMMEDYqtHQHjPMTZz6hjZu5nOgvO
         7jT9IJQPaafKIL6EfecJKxRw+MIbeMSaTXitRYJXMI14DZ86pxZQRcgXeZ5GiPIK2Em0
         L0U08SK252pKHfqSMlWVKPV8o2JdmwJ55O3R+MkOQAR1STum55EfbxQbbpOfW9UiRqYR
         Gza8HUU6ELTt2YG7KjY2uI6EesovvDjdbzlTMvu9IFChCa92+laEq9XCX2LP0fVwe088
         NM21EIJxWlUu31JkHnM1Ohpcr/RDnr39S6aINYfSN/JPDTxeSc6WnrS5VDXBDoMuIrBa
         2q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212575; x=1794817375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=Ht2ubQqvDYbAWUfa7p6obu7A2jmK4htFr8E0tZm42i6WgKp+NTwWqxUYRbciN5UWBb
         3kHyvQ6mY+NJpwx/65XbvNOwLU6iPvdNkbZwgZMhemghVs13A7EHAUmljgqlrdCe7sM8
         QX2A1JCOEreO8gftrrUvlb5VQu+7YMT1af3TGob/KvMUkNRaB2nW4h/oR4wyXyDwLiTl
         cAMbzVJWFfOnPuxm3GNAlKjHaMwCJLLiONuEJXBPJLaPUKm8b4nAGhU27kvZ1ZVSPcMY
         RMUyjfoBYPPSwKo2Pqw1NBVaz4w/zVggIlwxjSgCIbPWhqCDhd0OCd7VC9XNGUoHiCl/
         IVYw==
X-Forwarded-Encrypted: i=1; AL+hErGLy0z/Hmuy54Gt9vACceQeWjHm+AQ+0KtJkw71TlIiPIU37bbtw0n/JyI7Eh9qYzu/YNlB39Myg7zRTD8jj3pS@lists.infradead.org
X-Gm-Message-State: APuU4Z8gOfjaSfOYYYoDwkEgsf1HTP+/T4hNDORH1TZQj1EEGlMq6sZu
	mx4Oou8f1eao1tuXjgiMhL5zWbh+LSRO5GlYEChcR8Wf8xhTU19pEDWpTX3MZfUTijE=
X-Gm-Gg: AYBFou0NQ9ZB96huSflxyDYprBG5mFtqx3QwW4iSM3YqvsoyAFBxuaB8q8MVTJz16Gk
	8pu2cppSUVsJahGq5Zs9wN0x3JmUnNmCuBiVlRI1C/uQFD4B1EpOUuSOta0JEF4LfmyK69E/CTa
	//KTFAANZv/EoF2CXucHk3n6hvtge5dizVQcPT/0PGz+j44j1ynhaiDxSXeAiMBysET11cvVRI0
	++KwmqtNYx+tDuowlOCT1GdDMc4yKJs647bjJR/PoqsZ8/5r6XiGQMaIQrUdpLggWrtKG/bLDwV
	jE5laPAnVMjOZZLU5yhoYC9MLHxaFx5IH+drDRWp4Esc2MDt2b8wlqis3Qyja0aZ8IhNNIpW4Ld
	izCyP6ge8Ws1uth87Fzfz/rP4Dx2Id7lQWreSk8OOkg0vHFb4ZmxvEW+zhaJ9NXToRimUQ3kNHC
	91UvxSD9MFnvhoREQNyxTXVYcdO2ZAEeADwW8VLPvHWM0HTRMmMe3xKEYRtoQc9ypY5yjOjZCoH
	+sM/YBqPQS01b9iBWERnXdNegj1DTyE53gMJfJhzH/amAbXI9oi3pqOPAEBDd4MNj/AWoJIZzF2
	uXbV4dw75UqskwJjE+Ho9qfLdE0=
X-Received: by 2002:a05:600c:1c23:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b960da4ad3mr74504955e9.5.1794212575442;
        Mon, 09 Nov 2026 00:22:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm139701265e9.13.2026.11.09.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:22:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
From: Valerio Setti <vsetti@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>
Cc: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:22:49 +0100
Message-Id: <179421256915.10992.15316919043567627727.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=502; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=N6o2biIKf/6AqsgDmShn74SQm8T8RQuwU2MQPtShIl8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkfm27vnJKjU7tJrMtO/JTW7R3vjztV9PvXdLJdz0vgi
 7l76NTmjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyk8QbDf/9y36b1mSGnD2qF
 cz/nW+su0sFV6up2+uSmkEVTsmLTPzMyXK6okvrTo34y7vq6ezOrj8iF6VfY8HHHl3BErQ31aPH
 gAAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002257_938879_38193D26 
X-CRM114-Status: UNSURE (   8.98  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 17:55:23 +0100, Jude Gyimah <jude.gyimah87@gmail.com> wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

