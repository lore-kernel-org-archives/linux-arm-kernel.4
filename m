Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A830A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k72K7VeG;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fFtuKV3U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=; b=k72K7VeG1yQ9gh
	7M3tgJHhQcFFa5p1DbKEXIUxaKyWC14JTEBoxYjJBCqzCedVVHz47T8x+4UMdxzxW2ehJIzn40kRl
	5Oe2gDtoKgb4OBBoTXFZDkkUNg7qInE4YYgF6vL1djxDkcE29ujelfWtWATUkq56t8VKhYI5/Glsd
	kuqL7ASIeRhJcdUEWW28AsaBBozX2/fzsMV7zCT958ynV5M66LhtDnBvnih7mJimTPTkshznd6PG7
	0WakEvmGbLuZZNgUy6WXEaBf89tJN7XAMoPeVamO6ptwtyTnPHwie5bqVSxR7hro1YC7erCM9QTyb
	9FcmDo251JNSC7GSIeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZX-0000000FiR3-1lvq;
	Sat, 14 Nov 2026 10:01:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZF-0000000FiGY-3Pfo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:01:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491aaed7565so789748f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650464; x=1795255264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=fFtuKV3UpbTmsQAN+xHLesX9SFool5NPW41dFreCXGNFb/dX5a1AoGsEb9PKTWtYN8
         3CPBx2CySWicDsmVhygKhoeD4g2Ez9T533kNzh6m4kYavXSqvT638dNLHvlL65AnFVeU
         XA4+Mc0Ma8dgTOGDdV78N0E1zAdMqhhmJ03JKb5Uur+rZG8UlksbB01W6/OQEuY9eURE
         klIsgLQzS7gBtagZhSmZwW4hsmC+ZQ3+2vGReKS2Oovbq7rpyEcVSDHEKUF5nfo0N3tG
         QkqiHD3VXJs7KBcgKZ/lTpZYcp3ZacTN4vZCcWOOqDJYqwLNX7BeZ2ef7OdAQcPMfgwm
         FK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650464; x=1795255264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=xO752VvwZ8dzIoDyAw9L1kVgoucXWSPNK81FUJP7UboU32N+SUpjBWFkpbNmZFC76v
         ehsRfYjqbpPCvQl8f4SKPwMrYdKtaaiZU6cARrDNLU5wx/aWJ5NikGBMBykk/nIXswWe
         1FdL4Uj7qJqG4TcM0OpCI5u2WjhqsM8PvTjUNRI0gKDUCkPWwvzHsWTg6qYacbfOiBSV
         Vqv/1h0VSMJevpCm3/I9AQrvX6PXjtq2nxI8OVB7sW2DIvHIBEXHLDkM3mLZzYGTKZGq
         N8bRmc3SX8dPYZWWWpWdkwScfwMFJjyeyjRFlAZmuVuw2lgVxEVfLT7YZEk/7RiZgiRe
         WD4w==
X-Forwarded-Encrypted: i=1; AL+hErEPyktWxIxU1LTHtfZLHvYwd8Kn8GFNnbg2YU4vNJqqBYq6j+ai19uYQS9XYe3MY8t0A53lVSUipu3BmmGupra7@lists.infradead.org
X-Gm-Message-State: APuU4Z8axl4bFsgDoRRiwOJHbPGmEE6fNu2clJcUyJzhGfdrQAuOQsTi
	1dcOPN/sUV6/lXJ29a4K+HM4MRTkaN0fGMCMnRm/iHevaTk66/8cn63ylHKQPWz3lCqQ
X-Gm-Gg: AYBFou1VWbKD9X2ZVd63+5CUqAYBL5c3FV5n1v7OWygw14l/WxO8auSvEufbXhkGNcT
	Nf6lwdUXFo2tu7iE6yuzY57wZzRgb6ZGgLNtG1RyGJLy4AFuWbmMriDqh6dCwsmmahMkaVDtJJs
	GSKpwj+fLoaz1zIJSwgXGU4XenD7a9C0LsezyJDI/05TWbPbEoPvXFeR5AJZRKdY3onsXxRBgHR
	mDjzNKZQ3tyZcliTokzxcC07POcZDE7y4iZJoUZNSsdw0mkrsPzKx9SwgRkMf15zYhQi9c+SpF1
	n36MFFirtIc6qKHDzTzzn6sgffpojhqKMx5UpXGevSd4tA9JSWlvnEG21VuXyDTXKgipYm/fWEC
	Sa4Fhk/CDzcHQDYEv+wGznZl/ShjIw43x3IgYYA8io8kQ5+Etllv5iXI7N9+BxuM+UdYnPf384H
	ndy7H1I4IbDhsSptqWb2yL11Kz9Kcj6pJ8si9iXsF8iWXAfo3qVpg6h3iB9QiJIc+rq4a07IUab
	TlMiF89+VfjTZvJvYEHSCYqtGub5W74F8s7qEhZO/qxol+quvn8HckAlIPFGLBhAkDRFlMZMaAt
	4PJ9nb6Ew6zoit6Yk0HD8tri7eimy5Xptw==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr10335695f8f.26.1794650464192;
        Sat, 14 Nov 2026 02:01:04 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:01:03 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat, 14 Nov 2026 10:00:49 +0000
Message-ID: <ab06a2173b01f4e18dd24c68e03ef846ea933098.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020106_651130_C8CED466 
X-CRM114-Status: UNSURE (   9.82  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v7:
- No change.
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0


