Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8728606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FaoNaidc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cp2YQ4PB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=; b=FaoNaidcePQP/K
	SxwKkCOG9Q22Pyw4Ymmh5+dd9t0M2ByFlf4IxQrvSO3wfaHDmA1RicvqwRRl9jNqS7ijSBPbG0+o8
	XIsWD6yOyGjgyPb256s2li+KueI/GsdH/HaS/phshZ9997SYxd5nJL0Zsxd1U8vD/xn6fHto1ZeXt
	LZTiS/N3wUfddTpinQBX36Ugl4CPsR89AwfLJhQMtVgFSFvEK8BFLz+ry0+wMksOzhRb+kMTRuZ8n
	/4eG37ywF19KjRF+RUQWsPGeGYncGw+VUwiOoEcLUMvXUAhC5azZbHPFPmg5m45W4JSk5hCzjJO7f
	IIa62+MSnaNR96iLjnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJ6-0000000BLqa-3E7D;
	Fri, 13 Nov 2026 00:38:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJ0-0000000BLkb-38oW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5568965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530293; x=1795135093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=cp2YQ4PBhbeKdiuAbEyqQJqlwT1tQ6DUulWuGCxlJXhdwAlQf2TzC39kntkch8vysI
         OWYaXXJSUTBd78dP+JDaSYWbIEWYzjJILWpUulIZlF3uGowkXYzQ8qffkOEWbccUUdff
         iXmzZEf26xQn7n40/UaVEq5jthkbVHKLH0D7TEUETpFdWPapVSFDTFA34pTHzJLxPCkC
         LhDPnWP/EcLTxZdLiHpUqCP41J5fAY2zb0FmuK3/HEMRJVUjhHNl6Djj1u6W+QaHq4nL
         GXVi4KyfP/NL49muf24BxZbVk5mYgJBTW6LVO52i4lwyx/ZuTsWXcnAy+7Ts+EjNeR//
         v3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530293; x=1795135093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=TdbPdtFX3yaa+8/uoiWrACmJEs77ZOgXWHMRS4jHU921p9xr1QK0lawSl/izjiMVv6
         UlC7CLv4eS/chNu49HmExAnXVRQJJz6fTa3WL3Vy7/fE+YRYdCNbsQEOzwUKeUlWiKEO
         jvdCFuLStneh43kBCKjXI8twk8Jz4sIaR4yOudN6kFpyW3Wcz8UUJWL3fsTGwkVV/sPI
         DmpfvXMTkUds175tIx1TfObl2x1QfZgtTmYWIWBseWjhR/8G7odC+aozpA94pChC6TTm
         V7+l4GifSxjMDHrOZGtDClwUeNTDDbp5PqYJW+6rdLz29PUb6jr/RRUz9AQTMlP9u3n5
         FPSQ==
X-Gm-Message-State: APuU4Z/KqKivtAB0U+rb5+3Kgr7YX7EDhPIZRZziAg6A+JPZh1PfW03u
	umIrfiBUDQi4sSz0sGR0k8/m2nSf2dvfoCaSvx1ouEkreIhUi/NkkFEV
X-Gm-Gg: AYBFou103Z1Q7wi34OASX33CZ8THxaex8+Ew66N8XzzViWOQw26Mg9MruvaG6C0j1nj
	ti8b9/zGqnzgrFoexpKJy5NOi4P9P8MHTjTasJmcDDfvx06IbQAgAHWmGc5gOhr4jK6eXbonfDr
	ClJIaKUHuguoPN+k51B3rFGVrzHIi0+R0ldeP4seOVib48scNeKOr0JpCbfZ+nXQYBqEyxRZLx1
	jGEMQVHxj+bBnD6WeIhlliJKUY8BQO+PfwKZXAPTbrp8Xn8bERCeWlvPgs7RIDdsBn0yMWDXI70
	+0osiKFyjUmms+C3WZWjaGUCiUReKACEzHpPgjeK/BRDOCvkLOPqqVOme/yGp2Y4S3ESYt4v5Tv
	uVzQ9ZBdm/3hZgSf2KLmGn+MUsPKP2+cfihCQV0AicLge94auVqwygFa87vV0MXtk/diU4k7txY
	RmDSxJ6iU8ICw4zTIlZdCLzIt9O7Ty7EGrDgCSIoEV4ECGHVtfIYnkLQJCU6FKPCOVZPbZGo4rz
	qEmAEAGsX1BXFw/CDsxfZxEx5ZQunXoWqX3rC9eX3mxYGBTECo36aJCdH4hiHamMH/GypdSS6nv
	fZrSze9cnLk9IdKWFTEfeBLsGKwbam2XhTdHM7avlHp7RcbX1LdT8ksOm6u3TfQySjMl7+wEBG9
	MZbW5cdbcajDghf5CRIsIk7zFwJkUgdFtyetxB+2jgBiShyi8PNF0EIkt1cKEt8/9xU5yditOKA
	iHd5S+gpFQK1UdC2zOuNJKLw9ZBVkQsoevVZcF/TU=
X-Received: by 2002:a05:6000:611:b0:48d:f02e:f7cc with SMTP id ffacd0b85a97d-49c7044c3f5mr2386582f8f.24.1794530292921;
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm1975267f8f.32.2026.11.12.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:38:11 +0000
Message-ID: <20261113003811.3670011-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163814_830404_1823C022 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Philipp,

Thanks for the review. The next version splits this up like Stefan
asked. The resets move out of drivers/clk into a reset driver in
drivers/reset that uses the CRM regmap and is probed from an MFD
parent, like Stefan's zx297520v3 reset driver that you reviewed. Your
points apply to that driver.

Philipp Zabel wrote:
> Don't select RESET_SIMPLE without using it.

The new driver won't select it.

> Why share the lock? Each reset controller has its own register.

The new driver doesn't share a lock, the regmap has its own.

> This check is unnecessary, fwnode_reset_simple_xlate() already checked
> this before the reset control was created.

That check is gone in the new driver.

> Why is this initialized from CLK_OF_DECLARE_DRIVER()?
> Surely USB resets are not required early?

Only because the reset code was part of the early clock driver. Nothing
needs these resets early, and the new driver is a normal platform
driver.

> This is exactly the same as zx_reset_data, why duplicate it?

The two controllers will share one data structure and one set of ops.

Best regards,
Navid

