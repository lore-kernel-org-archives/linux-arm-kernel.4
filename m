Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F78606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAwoWSIl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB8GBTj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=; b=tAwoWSIljph2j1
	zE2VzfjS78MCF0FBIK8bVnoL4AQMg7WT3xUN7yXQiiaK4GrJJoSLfsluRKdMsARwZeQ/7sLB7/KxV
	w8njykVFTBbkNeUkNGA72NuvQLnedkO5MmfqLax6YzW5hCWq6RxckayT3KyPgUj1ZpvX2Tlzb/lWj
	4kGkHccQ5B1V2HfN/8etPeKASAJvzdKsNVExtGvMZrkxH3iPhAAQhjqZTGwVeDAKZFCLfuVu4uZed
	Yt8RQ+PYhxeVZbB9Jr0w7F1aAJI4AD2bj2hKl+Y989es36EwiZXuaVjJeDllliZuoXs5CEwOqa6pX
	hy0ipvW2f7txKwpAEVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwJR-0000000B2mP-3rnE;
	Thu, 19 Nov 2026 07:12:05 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwJP-0000000B2j2-0d1Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:12:04 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so26405755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072281; x=1795677081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=oB8GBTj3uCjz5RG2zL7uejU4ge6QHB68NzQ7jpObW69vQ/ncEoieBtEg2m72Kgx91e
         rrjjom9Vpu9NiA6BL/228O4Q5xKEGzGBCtQqTXqsK/ra3VDhI2vjchFQ1kDtCdAuzlen
         fSIDhz5baRrQ+gx/TUfFcTYqw656psyVM3jYvcfp9stNlJnMGpXwvA/UpY2bpYumYZKc
         K9R71wDQj5zOKUxDgjqroenK7KVZO2EYi3pMeJ0oHg5nZtlXGzVKUcuOrR4EtXI7ejlU
         kxlyL9EcO0p9iPx5ayKxYP+7YVmappAUFxKkSqZd6s2KhqMLHXo/+xrwjGYLhGMgQzFC
         c87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072281; x=1795677081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=HVO+ZjlSSVj5Y3lCGH8Js19oQ4/2yCpaD19jDiMjxTU6BxjQDYtmkS2t+GnNZQYuy1
         bgqid3b3BApZhicpFd1fPT7JIzU6PhWZLsAizMC53y+ld6r94wCmAOA4S3qPLeOZfd/q
         q3Cgx0+7eSVbwLpAQoa7zp9MAmmYjzTBnPyFDxD5x1RgNrOFPWfKy1vHsFzqyzVdlGAC
         GNyNHvW1g/2gWvUzf3ARZJBsHwtld+s3kkxdIFeNd4Mz2f85UvEX9groWJB2qKqCdOrc
         ycuMwqIqex/oIxDOsy9/H+M6bv8JneVH8UKBbtJRQmv5XvpUfzRA58Gs7CpITngCS0Ep
         C45w==
X-Forwarded-Encrypted: i=1; AL+hErG/eonMbN7gQxPJHySGkN1Gmt9YNhQT1qHsX/ytr6nM6IFBFvXOEGj4tWC0TwBUp7BNPtjcV+ij8l3qyRZRCRbY@lists.infradead.org
X-Gm-Message-State: APuU4Z/MNNQGQie8NrKzKHgHjrb6xTm5fW3dhpR0Tq7vn6g2ubJRiYCE
	LRZMpyQAW0jPnQdCALr9HNdfOf4PIUeDHqW1hIVWcBlzSlGpeXPHM4f6
X-Gm-Gg: AYBFou2ki5i6f0K/BXd27wpJQtCASfBj9q/QSm0CQpKSRsQwiR1ZlHGdxqNGqcZZ4MV
	hQBWVaXdwAgBYXshn9OHPBcqKvPozmvBrMJ4LSLo+jcTreagWG3Mzm2EXGtfx+44yph3epPLbSc
	bp5eKxpkStqNSw6sXTMpF5VV83fVZK2iDmzS7S6x/KEmPoXdZjn4n5z6YvrAkGeQa/npnzTsu+D
	Dgk6c37fSOcrX8cAoMPsqK0VmsmnuBYNyINuNGeov/JCX2MfgfstrZO2EggS1qkf1gZsDftkTTO
	M3S9EupmVjaL55F3e6d3jS9NmuGuimIjjhG7Jwmw82Y+WvaJGUN464qcZKkYLIfZ0KqNzT2wdOz
	rJ/odnFcn7C0Hm+UThakmZ3j8hDedUvfestJ4NsRQCEQM73eSLmgdukjN7OIna7XdPsmqq1jQGp
	68U1qgMqSv7vKtPW35nLiKkvxyHokOFGmZ1nGfxJ4jmDGUCkS0BmHyp8Pk66jPgqfygq3WV1AVm
	ZmMaNqzvIRyX7789lIwKi/FqvkWZUtnBMJqHWpDxw+WHLBV5Sj0z9EQshQ9p+aXYksLHZj8rs0y
	yUXoeGUHwVwj8rSJ7a35tue8X+f7pmzUy7i7E0Sjp+Z0UiXUDd6KGg3WM88rAzRC9RcfOGVjIe6
	uON7gd/VJgM5sXW3MfMBHTS9kVQOJPwCn1Nnad/pjEvyrFyqGC7+7WCERZH3VqPQwd6CXBqxbiV
	XmveeUv+RU4FRQVMlxDfpP2sw/SaPAXvU670f4Kf48VPZr0Owi5cBE
X-Received: by 2002:a05:600c:800c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb7da3d581mr99024035e9.35.1795072281098;
        Wed, 18 Nov 2026 23:11:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-0199-55e2-7041-f103.ipv6.o2.cz. [2a00:1028:8388:a84e:199:55e2:7041:f103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm8676988f8f.4.2026.11.18.23.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:11:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Thu, 19 Nov 2026 08:11:18 +0100
Message-ID: <20261119071118.78938-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231203_188764_30641864 
X-CRM114-Status: UNSURE (   8.57  )
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

Hi Felix,

any comments on this series? Devin tested it on wireless-next and 6.18
with two firmware versions and sent a Tested-by [1]. The series still
applies to your mt76 branch.

Sean, JB, the question from the cover letter about driving GPIO 8 from
the host is still open.

[1] https://lore.kernel.org/linux-wireless/20261108190313.11505-1-lucid_duck@justthetip.ca/

Thanks,
Josef

