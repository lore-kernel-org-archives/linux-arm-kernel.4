Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC960A261D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PMgLkQS1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IBQrME7c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=; b=PMgLkQS19nwm6y
	Oqy2ftgXofvZDqAHAzT8Jn7qdujMVVCxGu6vH2Z2llU9n7xYNZvR4ChcO3Qd6+Aw/EqhN7NNa2Wdu
	k4zcDnpKqBGOZSPvRm/qmoC9QqrjyEPm/DyoMS6+85uFhby8LoyTkufAlsIoLvT+LWBfdW4UzR5Ya
	76vgRWhF41+mlyCi1UmkiVEu0NiL4qM1orLFWeNBIDoMQ20dpCll0BAMuGCMqWGcdF2oeDRVYvmup
	eDmNmY1XTlB5f1LOWv+KbacXQP86GRlJCIfSn9OifEI7CYAGzYs4HqEcPRDVZyeBNzGTolcS+8ORv
	tuh+8VLebQqCVAP+d6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ68-00000001xiq-3alz;
	Mon, 09 Nov 2026 23:48:24 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ66-00000001xi9-14wh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:48:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdb2893531bso810537a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268101; x=1794872901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=;
        b=IBQrME7c7H5UV732uo8J7NKHRok9HDp73MO7NnSpAN+fjEaHC4IFhkn1faAQNEaiJx
         A2b4I/Aim3JNHnXv+Vhsu+FiHXh6NAHLmjZha81LmiblwZnl4/UBHJRP5od44JrPAkDS
         HPh//IFw1z3jK4+ELmG/9rOPGksfpcs2JZj9C9hr20foYUnie/UKUUzrcx0U0DTcNrqi
         UY7KuPu7GwvRuNuyjtKswfGc5WP2A2OaEbP2JBhJoQEz2U72eNXEG0LnGfOiMgqZz07+
         g1S9tSLoe/5m9nxALOsvwnK6slxnnahPTOTm3vSFgXObGgBjvO218DzMz9gmh9XvjJsq
         6biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268101; x=1794872901;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=;
        b=ctDvi3P1A/1aOWl1lG8aWx28hXx0+ALnLW/aUH84PgeRCv3xHOvG6v7iUyrjo/ro7+
         LwnDtkpefa+NWtfwQI6tBHBx/v5Bx2KOAjgxG3Q1F8G0lg+NI1/dRawB/Yvgpp88u/Iq
         P/un8xMDQPBMO1VlK72P0TfDxFCcSc8Xo3i62esDdEHs295hQYoo2jTwO7gynaEZJsEE
         m69fhcx+qzvg00KgsAUxflBcomMXNsle+o2ReZrJg6vhpLkLe9wJWn7E6HQlE2Y/Yxif
         4CWi5YZcfB289JSKCRqs57RO9YM2l7N73EGiKOdA0mcMjraVRv47Wvhul9ZncK25iDd+
         ztXA==
X-Forwarded-Encrypted: i=1; AL+hErEIqKQsLLDOtzt3QIvakBuY9vGW8dro1Y8Y6wPQJEqFXkvrA56RDI3NeCUVGjdpp+ShKj/Y3YRptJN6jEwz7wDH@lists.infradead.org
X-Gm-Message-State: APuU4Z989fA6mX7+sbmHoLTD9ztOHMfZWBDME8E/KFKw97FvoZb2RivT
	lCg3Of5J6Y7x9t4sYuRuBIfUnALD6nbJm8T1gYXhxLoPtkaVzBV7KgUtpGi6V2pbQj3ktP5hSbF
	/vt8PUGY=
X-Gm-Gg: AYBFou1R75eWKi3EEExl2KgO9/IZn9O3jjuHBYz5mKYpe8OvugKJ6jS9bu2xyhnGDgD
	+KiZbt0zxb78r7ZA2VfY5ctNrHVlpAaAYN8O2cgfbGMNR/TkzGLuVZtMKL/C0q2laz6bXlWHHaQ
	WBaV+IDfJwpjflb5mhuXVZtkiXPy/4BVhZtBPA2ZK8VigX5/P72itKtjnFKBCirvZaw6b9+xuqW
	iUBxNi8YODKSy0cPk31mxMz5nE07M4bLAj8nK0yWXOfXNmw+AuTLcn+aqJ6KQ1AfuQ+yfAZTRqF
	glH88rQBwy+Bt6aBX8lW47qCJJid6SNNV3RNkzrqCjiNsoDRUKcW2sFs3H/zqjHGV8OLIp3gVeg
	U0+Q7g5nbRaIGtr3OvRGlSUDiE3yw04UMCiPwDy1WQIpNHQwrA4Q5kpptHJeWL/3l0nZmlj+6VH
	IJpvsv6kNMoxD5fpsu+GsOf6jXkCuyHRs5tTogtTj4uC6EGtbYA1TQ/Xp+6v507M76q7BZA4O3G
	ZHjXZD8t1+4SBPU7L9o90aw97VGul2wQEqhSQtw4KzVKtLCKT6nmkKyQpj5hPTVOo3BYdhZgr4t
	HxnkAgFJz4GFgCt6EZV1Zi4eejXp5QGOF6lyBGHLfxaRgQ==
X-Received: by 2002:a17:90b:4a0f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b166cc0352mr1249763a91.11.1794268100946;
        Mon, 09 Nov 2026 15:48:20 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b166f542edsm1433378a91.0.2026.11.09.15.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
Subject: Re: [PATCH 0/2] ARM: omap: cpuidle34xx: Fix unbalanced
 cpu_pm_enter()/exit() and cleanup
Message-Id: <179426809959.2265990.7562894927493541429.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:19 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154822_302901_37A4DA28 
X-CRM114-Status: UNSURE (   7.49  )
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


On Wed, 28 Oct 2026 20:15:10 +0100, Andreas Kemnade wrote:
> Fix unbalanced CPU pm calls and delegate the question whether the
> cx pointer contents could change to the compiler.
> During research for some spurios FPU issues, this oddity come to
> light.

Applied, thanks!

[1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
      commit: 97e0f6eb6112788e7a46376998e797b4d7d6f524
[2/2] ARM: omap: cpuidle34xx: Constify state info
      commit: 6d6f135fb1c38fc833e4189e1db47eb7060c0b1f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


