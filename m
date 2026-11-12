Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A31606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xk/YxoDs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTLoBrdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=; b=xk/YxoDsj8xj9U4+TpZLWV9ubM
	VpIPpLeiq5CMZP7PGZtJ+OQvR8QlMpKpTvauU3tIpQ/dNhvfYN1rHcV2jKg2zB5zkcJ54iobGsXMf
	j5V1olxSl/GR1ONtXmshk170VcUfzsZKe4OSLtXF0DbMjSnADHBlBaSrMxwfrrzu/tkqLEwkeozr3
	CdgiUJbedDvuTvtNFiWGS2hePbZb6oJQpD17S3w9vepc/WQpQAS2rBXxpFt4z8wshABTZeA06aTqO
	FYsYNaoqryMCMixJm75YLzvzbq0/lCa60y+dSbCWmygwE55KhzfnLMrFP+1EeacUvq4q6QqaL41LK
	0X7Rk1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdN-00000008qnX-36Ba;
	Thu, 12 Nov 2026 06:50:09 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdI-00000008qlq-0PFi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:50:09 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7306003eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466203; x=1795071003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=;
        b=zTLoBrdlCqGdA6uuJPjFOfc3GSgkxpj/Iz5oqn8rLPJ4PRF9RRekorSKyVCqGPhih6
         e5vvPPGG7wgJ7qnwbJyUVo0AdtMHJHvH7/A9656NOgunUsaKawRP4USEGDhK5xDXLs/C
         eY7rTIE5vDEyQGexNj1hFeQ+GV2iuMxQLvpc+RpoZe3LH2rx0vmwcudfvxydbbeU3TVH
         77tdj1XcscE8HSkdov1MyAcX5vkc4KU/va6jWgBRYblWGI+LrD5syJGsVyxfG9U9nqm+
         yuABXHI0pihIcZc+0/xBdE+G70DhbtzKD395xFrHtaZnK/F8T4LB7q11ktJ3sWaQ4dCi
         T+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466203; x=1795071003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1v3GwTQW47LQ5TJOhvyv2Mw5v+tziCrMDZBrKab9Q0=;
        b=oawxH3PsdKXmx6bH8e4NqWONmsily09vxEPWUvdrfL1rJRievGZQ+pRv2HBVMQiNYi
         UU8MY5MkQ5ckwRZNOJ71ocKEosuYZV3PSPRvZrzQ0bwVJvECwmt8XuxRf0HEcLindzmU
         wqd7si/9FVkDT75LODNfm8sVMUlZW1gJuwayYby7cLABVLxCtYQMWb7zfHMiJo3dTpZi
         Gdj1eMLmovWQuw3o5SHzgjpGSsXKeZzpPZgtxK/T3+MAq3D2tCtj60AfzCA7OXXu5hqH
         04aQX+z72teuAKF7ATpH8v8J8xJEUz356W09pGnKSTFsF4e4kXOTFJdC/QghwkKsQck7
         Jifw==
X-Forwarded-Encrypted: i=1; AL+hErF3a1xVshSwUz1t4O5bPjIJkLYGdlNrm1WRTk2zpng8tb669uYf9p+MA24OrOp0idghlkKaFk6Z45cxK7OzWze5@lists.infradead.org
X-Gm-Message-State: APuU4Z8CN25E5/aTRN/ZdopXDXFVQbg95Edxy0N8hSVp8vvEArXnwi7i
	HqnWYD4xsO9zPNKfbL3iDyiNIQ6L9asEqqpv9aKBTSsNdfZeILF1W5gF
X-Gm-Gg: AYBFou3jU0LLqZFnvGQoIjoYzFWBz+JdGUk4Vgn+9TharLdwyoQm6nYDlR76natlI79
	1x+BSplqWvPKpu/QMXKxzNU83w/RYDl+0rSBv0rkl0fMEEBUO4npkHHia3v1qkz9ADLhzF5s13Q
	J8J8ijlRP+0UQ7JSjif1uHL/gqzx1+N+u7eDbucbaFuiMwaJeSerHm8UF6shxvIyev1uedIzlbF
	d6mJ5i5m26jxTm7y+m96ZiqfZX7lT0gTQ/Vj9ArAJDrY2ndaxcpeu2cW29mltJ+2tgHGH8RBpCa
	1xpUT2Zh/+5Zn/uhM7cOba/DhU/sK7Ue6Wfw6AiignFbe+x5h936kBAgXLUPOi9d3ulOZkmCSRo
	olFJSpwx/xq2nBs6B1NMF8lMXHqJXWzO9kTdTpepwyrSzug6HCdw+ipjG8EJldR7DuqaiHkm+kw
	U+VvCGl0TGu5SCs6gsK72yJALPzz9zYYicJQfBZ5/ubyBzYWtpdNB6icKVVcYQPg48lvny7wl/H
	paCcWQE9caOiiptovZd+2RPFwp/m6JbkhvQpoZgYbZG8xi6KJW9+8yWfU5vj9MZuoD3iH+AEWWl
	pwgDfCfv4FbfMoFueoc4rRLOfCdxSGspuNGQEfXgBmquP0dg4XICuKFHu2ILd0PaWX0ukjxbIdY
	40od3aQbohrHzsUFL
X-Received: by 2002:a05:693c:8852:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3768721116amr4902164eec.36.1794466202380;
        Wed, 11 Nov 2026 22:50:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:01 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Input: ads7846 - drop platform data support and cleanups
Date: Wed, 11 Nov 2026 22:49:52 -0800
Message-ID: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_225007_819360_E9F0E62F 
X-CRM114-Status: UNSURE (   9.92  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that all in-tree boards using ads7846 have been converted to Device
Tree or software nodes, this series drops legacy platform data support
and its header file, simplifies sample filtering by calling
ads7846_debounce_filter() directly instead of through function pointers,
removes redundant memory barriers, deletes dead code, and cleans up
minor coding style issues.

Thanks.

Dmitry Torokhov (5):
  Input: ads7846 - drop platform data support
  Input: ads7846 - simplify sample filtering
  Input: ads7846 - remove unneeded memory barriers
  Input: ads7846 - remove unused code
  Input: ads7846 - fix minor coding style issues

 arch/arm/mach-pxa/spitz.c           |   1 -
 drivers/input/touchscreen/ads7846.c | 434 +++++++++++-----------------
 include/linux/spi/ads7846.h         |  45 ---
 3 files changed, 171 insertions(+), 309 deletions(-)
 delete mode 100644 include/linux/spi/ads7846.h

-- 
2.56.0.567.gdb80ae8cd5-goog


