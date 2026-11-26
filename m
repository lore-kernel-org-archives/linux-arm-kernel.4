Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00EA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ILvwjnaJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBWuHOM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=; b=ILvwjnaJzGTYdF
	mJROBrHlJfXcFRyXyu9xAaAm+GTyNmtr6bEYLm9UoYQnHt/fP/dIoJyRJM3UiXyIU+ejF/oTRQAnB
	KzBsIiphKTGfoQs1rxKcmI/2vsgRDqOAXOzsCi4WkbnVrtyqSG16xxbA9OTK1BkCMu0Cdi/MVzVf9
	k82HFXm5DaDOCACmw9HoBVG9lSlT5rbPXRbwdsaD8rXRQKh06Z+TG5sLRGm9XIoyuscbm581KkQgb
	PTbPU/PLJ0bOy5p6oXtuyMujBtqqbXbGKnCzUP5vttqFKO3wxrYwRCi5FmpXBuQMjyUSzkcOm1vKO
	flj4Ph8sMcYJ+Lmy2/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT8f-0000000CD7w-3SY9;
	Thu, 26 Nov 2026 06:39:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWT8c-0000000CD6r-05SI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:39:24 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so2910203b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675161; x=1796279961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=eBWuHOM5xAextLeNQzga8s5V/0psqEQ7Yh7SP9XZ1Pjt/qIur0IXmBzVE0Tgpti45o
         SgIY+nxO1xmrE62M9+jyJL3DelXX1m7+eqqWYscskKQbJ4O/5HaboXh1TuJTYvZtXH66
         FXrSLVYHFEzLMnoa1w4L7YM+6x2rG5gOXJ7egXoVXHI1/xS2GRLsL4syIHkF+sfLoFzO
         KqhMYztrmt1b14U4jCrvvkvqnUIv7Vt4nA3SxrLrmVSnNHEj7vtBuDolgRaJodGV7r+q
         YGWvqfPUeB3S1szifoGv20ayJsOzzeyLT8QFH0q63xGASj45vqrvCvNTVKokLTO7hPsp
         pvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675161; x=1796279961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mX7cQaJdQ3Z8GzuWZM+Tv7znYIvTndE2qCggNaFUZmE=;
        b=S37DuXRT+bgYEWMZxUblyGcJcdxCjjWFW2GgdPxR50ARE+Rt3G9fNT/vLhwevDTNkG
         Du1UpoxgjycEX2CxNj4q6SOb3MuepV2xNmxMP1vnwbXTpsyanaM4i4f5QTAgZXeIBf9x
         kELnRjxKcKaJoKETFAMk3qLtE/w/3FPGh+xu6Z+QhH/HNT/djJSny/676fxlSjdGbXyj
         TYNbDiE2VyfKk7++xD8yt3lQSxAkfTRzxdSkTRz90KRe/nSedThvBLOaPd7v28n38aPQ
         VwkPu4qYnlWvHIUrY/KkHX3cqXpZ7ebuH84toddEhnvvwaKl1pCRJexQjjKtjoNbdJsw
         g5qQ==
X-Forwarded-Encrypted: i=1; AL+hErEXCQefHEits4nCLOEKxiQe8UfAUguEgnNS1v9svw21sFFFRyhR3LCGx+7g519X62VXveHZfZ2Ge2luzAeTVwft@lists.infradead.org
X-Gm-Message-State: APuU4Z86M50Ju9x8dfyW0/yFOxnNKgnLhV9MCzAC4Jv/jNAJ3SfouTa0
	8njVfcGjce3kV/FlfDUqlZTMv7uSNwaMw72snJtA8lkWbe5xGVRhOLN3
X-Gm-Gg: AZFdTZc0nB04fDcKQTo+1ibHmjdRwhlvhYCGmNhkqohmn/JsuUVDtLXZb3eIhfXHuRf
	HX1yNRUi5DGpt3kJau4aX518wCZ4F4+Vgzf5IaT8eWeszdiX9Pw/ResMjtoTGftUnwl+8a03Q5k
	Bwg0+fI423sE2tV1JrksiFcCc9oGq1nUGcX56Awh3QbIND6knImVMSM9mzX6BUeJexNC9534451
	pAlL/bsBoD2yhb1do4MbPV/yYN5Wj7JPsqoz0vNPwTK8I6S/ydWQOTS7IBcVnPvibmQ0xp6fL1y
	yQ6Ri5SirCMG8ZGswixDxBhNSadfACCQ5Wt+v/tdkILZCjcD1mFoFXH2dtHdEMnzhG6cr8c8+bC
	C9Bch8eNyGP1NsW6gUx9qHPJV4yA16rxLyGVqczUtj2Ep4hIg4oBYoJdW5f1HHn2lbab3OlccpV
	r7hKWhnvaxR3eyJmBlQO9KE3MkrT5Y2HgcxAPSnKfoRa/f+GgQQbSnKJ+Df/bMhIWXL3+OZFTrZ
	a+Vd0a0xiQqPkEO9Hqa5iI3oaPyDXefqe7jIYa83ZtRUvCft9acjkpO7i351iFqsYDilaTxe3gd
	G0fVqR0D0U5KA1RmNHRxBRnJ5ZxpyOeQ+GGYADInK1Q5gfbElpfo5lY=
X-Received: by 2002:a05:6a00:1802:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8c87c389ae0mr18623299b3a.27.1795675161015;
        Wed, 25 Nov 2026 22:39:21 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10297575b3a.8.2026.11.25.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:20 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 14:39:14 +0800
Message-Id: <20261126063914.3237108-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_223922_057889_B33FF8E9 
X-CRM114-Status: UNSURE (   6.24  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks a lot for testing across three lz4 versions, Yann -
especially 1.11.1, which I hadn't covered locally.

Ping

