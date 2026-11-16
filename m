Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F412606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oZNl0WTn;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MLVwrKUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I6OtxI7WL+2TeS//8ueyKGWGZTxNUmrgjEOWm9wxKMc=; b=oZNl0WTngC+NX7
	vaIYgLEnpArsAZeC2oRiHLcT5/Iex/LJlhFQvDOhiXL1zC/INxgLKe1hR7HRxLZT7WZ+qQp3DRbzo
	Ch/ygvOFXycAiQ6feM/XCLAalPvpvlMoXlipjatH4zxjCuyN2zUyW9MbqZj7EMUhfQGP5J2clezMH
	LXe4YGoCVVSVT58NzeE4WZTTGqmMuIUI1XWBNZcXTE/uvoghQpd9DJUNZl9msJCIU5dn7kgJV4hoN
	4gNw71LKVoWwAGVBM0Nbmi3aELL3V2pcEGy2AowD2YJg8QxgMW49K3LCT+46Ck8cJNeHgo17ykP6K
	O3EemXA2PWsSUoNhPHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzNq-00000003Azv-2ysZ;
	Mon, 16 Nov 2026 16:16:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzNo-00000003AzO-1fvi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:16:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3555155a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794845799; x=1795450599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6OtxI7WL+2TeS//8ueyKGWGZTxNUmrgjEOWm9wxKMc=;
        b=MLVwrKUevI1nqYtNHizEv2xJidcMJyq4uaKVBh5L4xmxGnsHxHMIkn5D1HEnKnZgd7
         JI3Ke5XtObCRo60psipXRRXkE5MUAK+XY0O9un2jtOW7Ect0xtTD7uSLEwa9/SyD1yFr
         TeHdmuH3NWLwfosjduShIl/Pc1Mi9fRy4fw9q9kHuX6e40+t3FlLVQYYq9x3sI9JOSjQ
         Ypa8q1A4u0gs/5CWfD9rdbr9p/Dca0KuFjVgygpZYQmw3+WmABPCQwFh/K3dDkcPkcu9
         IM9LUwNZDsCoSafzThtasZSrjNUNj/9ooViaeSnx7BR7Mz/l5Xd7zyt6cEhhgkKNv+lY
         aLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845799; x=1795450599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6OtxI7WL+2TeS//8ueyKGWGZTxNUmrgjEOWm9wxKMc=;
        b=S7iL3TGuNVOStS+ICsqM8dRvTsJc6h1bzdaMABQIztWz2D265+87MsEKrVCNBoXCpw
         sAKx72HPNJ+b5aEmjz7IrdPy2LcsCc/EDe5ytrzyUCIrcqLjiqrgoHx3CGlEEpg6iuXf
         uOFMUVptZPnLMcgQV0NFY7+uSAYTf8G1ck+y0BW2NjVuCuaWDnCf/xyO3Z5YzvFKuquQ
         kYhaimjFzdHwL55a5nbJz18rsGSla2r15weEiJSww4IPtlf5ex7u9jUdiMGMD6PZSEkQ
         WMus8bpQ6tQvah/6JcBXUOjW/ywTsJLwbkDnqXhKvs/iQktAtl1ZfUXF7zAsYg6r1iQu
         YDIA==
X-Forwarded-Encrypted: i=1; AL+hErF5oim45z3y6zuPYQ9Qx/DpWJTt5J2qElmM9pv+OL+QaPP9rHkd/DsaMaTAQ118e2NoWTtC5Kfa2G/iliIXee9d@lists.infradead.org
X-Gm-Message-State: APuU4Z/Yb4qY3TJuw3OeJHgU+YHiumCutR+RIGg086pu75X1ypNLj4L9
	Sg+ZPcm0LVKPzDej4MCPXd04oBjgfVkzGjt4hqrix4SsSo4iudChnd/HG3YX+dPZpqQ=
X-Gm-Gg: AZFdTZdBZ/gj2elIy/rQTp8SKOhkqWMedDiO66UcedQJAlbictdTvBe13sYgFzM6IF7
	+feSqnBzc1fJEFdc4hY1RT/FgyKWMK3Qm9m83MtKDJnM6Jxdk4GjtIhhmdymJBMccl8T/FEzl8q
	CuAYiR0l5VbNI6rEYL1hsYgysUmkhrRPgVSVmuTKfn6a1imUqT/2ENzq5s9gtwbAmb+5e+XGLFF
	GaW1LBLlTB8Wxqk+b8awubpdu5XifHsp6Dsx0l+QijX9o/4sWF3pO6k+NgWp9ROvUuJ9Dt1pep3
	GNjWO724VOn2S2h5ibhmwbwdJ5qztXG8m3HrsbwTzjKIq3wed2ppFqCjW1Yf2c5JC0EMbUZLryP
	hsEkkIr1QMgxi5rnPWretGra9RDjx/aS6G1NNpvUQX6Mc27rsDDms95rhZfESU7QOX3We2JHWA+
	O20lXsmvtZTCozgqA3JfXi/TZJ47vRjGww0JR7yLlnVdeq79yuQONRmKZG4/ySCGAvP84Qvv04j
	thH2b97DsriTK5GNloDhmHaYcoy8UnGetQ5bsc8jCu8Ar1DUSa05bJllbatCoCqabGdpTjRkzuW
	UpPKKKqBbXhBVhFY/qPorf2M
X-Received: by 2002:a17:90b:5112:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b1b0cf4395mr11537025a91.48.1794845799382;
        Mon, 16 Nov 2026 08:16:39 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b1aeb17042sm17307491a91.6.2026.11.16.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:16:38 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP2+: pm34xx: add NEON wakeup dependency before clockdomain idle
Date: Mon, 16 Nov 2026 08:16:31 -0800
Message-ID: <179484576799.84649.9190527737165313514.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
References: <20261113-wip-omap3-vfp-neon-mismatch-v1-1-3f6f67b25251@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_081640_435945_FA067F8B 
X-CRM114-Status: UNSURE (   9.59  )
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


On Fri, 13 Nov 2026 10:11:05 -0800, Kevin Hilman (TI) wrote:
> On OMAP3630 (BeagleBoard-xM), about one boot in three dies early when
> a context switch touches the VFP, which traps as undefined.
> 
> The VFP is unreachable because NEON is powered off while the MPU runs.
> omap3_pm_init() sets NEON's next state to OFF/RET and lets all
> clockdomains idle before it adds the NEON -> MPU wakeup dependency, so
> NEON can power down immediately and stay off until the MPU next idles.
> This was visible in pm_debug, which showed neon_pwrdm OFF:1 while
> mpu_pwrdm OFF:0.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: pm34xx: add NEON wakeup dependency before clockdomain idle
      commit: 604ef0e4d9d1e3b9717cb83174817af58966d30f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

