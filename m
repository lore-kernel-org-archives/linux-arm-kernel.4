Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nlJVW7+h;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gDe6LmaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=; b=nlJVW7+hMLbwA8
	Ppo6LXQRXN4NH4xAhtTq1ko45csWRM1nnBOitzyaAr9nXYpxctQSJ81AVFQit3/5UjGinQLOCzkkb
	ReVbPDummsxQNbVDCCctWA1r7ThL0VmQwhPwnnKevRKsChRd1gUy/hUYIzlAxpulBr+7KT/O/yhZc
	C9mVuzXG9AOWyfhzJf7qIToxyK2cUvvtlN2/omg/+qd1/+LEWmEVPH4413EsrPav2pkBRTERY8r8N
	4wX+FsTuavj7gphajYsIOtKDhtdS8/tpktwecanjz+76G/hF7PHaBoauoh8cWa4Ka6KDbXxFtkEMu
	QL2CMPYsSPmGPzOiPX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqV-00000000fsG-20Rs;
	Sun, 15 Nov 2026 22:37:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqR-00000000fqY-44XR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:37:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso20962535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782226; x=1795387026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=gDe6LmaX9UtumERrkNPTqxua6njSQP4493F1v37+eVkSGLkIiMzGFCHuu45Ni1HbBG
         jgUMbu1kgwszmo7Wmp7Bsg13ua36c05+3tUvvl8X9tP3o4dTZufQrDmDqswr2vIQElAf
         UbN8fruzk0MZHm0fjPGXh0/4kPLRWBCtCtmdYRsIX6idY2m5JxItRXhb80ie/01PkRlw
         kcAzTN0jWmea7QEZMRLdHco606JuK/YywG8FysnmnrdK+KEKhxHx5SFmG1tG3bTS68Fh
         /Xf/bYZoVFWxdrd1iOD2aBO8ilssgEnZ3tAYwdGbiHM7vqiRhzmiY1cEX9mXKmSQrWk4
         scfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782226; x=1795387026;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=RudwDonL8wjVii3JliT7sZVgxuXmwMkwDzYtkZT8iEutfSEZIk6hZFLZR3aWoIURkp
         9jghaUs6m1BB0rqb6qWdG9TgOBLXGJa1IxkQBdz4GC8LInN3/UmodQuQa9izcr/CxgcL
         0RRAN6jVghJZccWM+/73OK7OuBhSnQ/YH37XofULA5ynX5W4VzP1cX+Xi9qr+pKxkyi9
         5XqoW7sxqlRVW+n6yGzN28mTVgA6WBGYZ+hlyeR3wWKSmVtvkIU7ZOQMp8y78JopE0FB
         MD1vcBDujRUhzIW7wwPQkTYflCHg2VGtPlQf4ZLsYfYfEHDiXA+s2YshoK7RlpXl/KNg
         Bbcw==
X-Forwarded-Encrypted: i=1; AL+hErH4FGPAxRO7TyxQ9xGPZ06ivKLKNoi6UjShVjbj1+zJqG7hP1Qu4VUCmttRfl17K5Y/hTpJgdw4vEwcyxVxlIPO@lists.infradead.org
X-Gm-Message-State: APuU4Z9B0q6xnIBB67RCHelE/eQwDL0sQuMSjam9T0HrvfyQhUbAG6Y1
	rpAW550OL4cOJ2Wee3TcXbxpcMPvtyNMiRRbnUKmRg9XPabgdT3mURdDl5ZVN1MIiIgMvvogfrd
	OC1g7
X-Gm-Gg: AYBFou11Wcv9k4/KTiBujrvJkQPnvG1xTI4vBSgRPlEMILzf07aUzxewVpUNCL5/gf+
	OYM44UtCkj8E5/tvQp6odWkZI6m4ug/5vi7zMzelDGcdMPCYrYNgwNQwd1H0ieqd2zoFmAR1wyL
	7yUb/wW032FuuMjhjHgNBJ7InVOzR5fij619Q7ggxLGesoN4XIqkrR/qXF5Rh/1KVXOOETj2K4D
	l5j50Wlqhf2zX4piAFbFWhGYtdwJOzMmQaZRL4f6Z2h3ZuCbgL0VODFFN/l/NpvXUfyDEqAQgAn
	ePzzoNKSblC6gLyCN9RPWB3PKfNBQ+rc3QJvsyvhDJCsIr5pL+2sP5ob0zIr1EoazLNC6PU3S14
	IB3JCTRPt6SBJbLt7k6aUmAbkCkYIbwwlj4gIsvZtqcxaEKo15ssbFmlHaBBQxglUDXG9D8sr7g
	NUYIk+AkgbHlLF1zzI1J9pWPSJDlX5TPDYOVqNHHq4y3Ye6lV4oabi7lCF3ct+5NwMjlACe8fDY
	n+VvJEAhpQKx+pmi7ioeWn535WynQfUrSKbmTSeX6gUHj28hpuu0/KYqzBEMH8PRrjvdqw5HYic
	H0TeGHIPjFdRgsomptXGzaDU9Adil2wfPS5xzITb+71S6V1Y
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr5026685e9.7.1794782225857;
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7292c04csm27506865e9.11.2026.11.15.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, yu.tu@amlogic.com, 
 christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Message-Id: <179478221481.13037.4595055180281805820.b4-ty@b4>
Date: Sun, 15 Nov 2026 23:36:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=190; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kSp2XHPUdyj9arJE5zFouPgC7s5Qz4HXMfZKSQrP6NE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/TAR2851bnrrGinOP65LEaV2sCwq3rzVcpp2+lemH4
 cwdh74xdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAip2Yz/NOYuTW49Gm/6ZoV
 G1YHrvFptfdZafT5u+2+fzdjbRtO1QUx/LOVE65sn/R3te9l1yuzrse/cNlz8cvRu/85nq/4eiJ
 RRYAZAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_143708_024997_E5D78750 
X-CRM114-Status: UNSURE (   5.35  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] clk: meson: s4: keep the PWM clocks off vid_pll
      https://git.kernel.org/clk/linux/c/cbff55924b87

Best regards,
--
Jerome


