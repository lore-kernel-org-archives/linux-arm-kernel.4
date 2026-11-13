Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D00B606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNg+TL29;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3WErEDo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=; b=xNg+TL29a3gnekbjwUvvGJaM/g
	b+gDpMQ1YpE82CfDyVKbtk4Av4NeT2lzIe14xwiJ2Peukp+O0ymJYl2P0K2rrbk/KHMAZxaO0708m
	ujyoSAVSPw8fep7EPvCqUgoloxvsS3fATtZjnyUgyvRlx4al9ZABOJEnP52jYq6HyLhB1HArtYaJs
	bcO3OvdqgILgDcdtLwouwHcJfxXuFu2VLAgZmVc1vBYdK59A3ycmIhXZmzibCqmAqCLof+lG8EHf3
	oO2dEWBy8cCxskFHCpEiusQ0fUUPQsp+DnqcEkzyf0KFoYVBxCmhBcNWKpCIgEIkVE3u/0wtQgzmw
	5ZYBQyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofI-0000000COMr-1u3S;
	Fri, 13 Nov 2026 10:37:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRofG-0000000COM7-2ljE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:37:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so1133466b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566270; x=1795171070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=v3WErEDoDbT04J5BiNmnD75sNtH5CeSivL8y5Qwr1Uvy0pqhQVN4wq+A72hpUmgSCw
         xqjM88Q9pgw+DGl/WyK7Mm0VvfStxOnljXunHnoc9L0eilSohHhXAV5O3bMwYbwbbH7+
         8mFJ+P7DSU/HtspuGZkMrV1F9gSaVl5VbvYpv3hBNAnAwKzAH7aOBqfSv1teNOivS6EB
         8UOgyCTcaPLfl6zT5UiRet/qRtjCNyNf5YPndJ6mK/QIstCLSjrWyNo4FyVLKZ609VQ4
         UT2T5qDQ+95M+5sf5p0HBsplXLI1GwrhcqWdozjH1jH42DO+2IkfF+MbaaqBnL3sqgK2
         Q3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566270; x=1795171070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=tfjKnygHLh5y3nvZF56lJlyYPcobWPQVg1UvL3Wfrp1ukziY490ppqjH4eolP3CF6m
         YbP0VAXqcw7mNFPjc5sBv8UcVd0M/cd3JLlgR+Mlbl25mX1rhNIZ+66GUjwKxU/H7oZb
         k4hIAdnBu2Px7lG5wxl5NG1eMHSrizGJPN1EY1bLPrI7xgN2MSKOCwtxDD5kWVTKdLYr
         ihUQLj096E61KU18VG8eYvPMSnG3LX+bcAJ7zlIO9ywJ3aVt/4v241cGojoTo5z/9Do1
         mw20O2/z4l9g58qiMOfm7P0RY4GjBskHHRVt+PntsYjIeTLeRwRraYOheR6U0pHFl9rJ
         Gg8A==
X-Forwarded-Encrypted: i=1; AL+hErH3eAT1d/js+eN+5KtrfSNzd2pkPycud1zuGgVik464LpdBsB4xQMFy0XNB0cN6QDiOQ9J28/jyKQ3GETSK+CJo@lists.infradead.org
X-Gm-Message-State: APuU4Z809nvXxevgc44QDBXsHpEcGFkzwyico33QBZcqeY1EBfKQFPeo
	jPUAzaieZn4qW2p83khCVdEMSkoBsu8pUkS2XXEWtVA4lL5HnPa+41P/
X-Gm-Gg: AYBFou2ESG7sDixc3LNsKlwGD3XO7fdsie3vmoQ3UY5uXJGv7dtTlCljnXOP20c/AjE
	LMUmEp3uCCSjiQGkjDVx8mWUVHMS3uupPFRdFXP6YJ2x+yv8zSZb3hZRg829D/XE/qNLeBBtxe4
	wqyjcT7joAcifiBZN6TGddQB52oyCPAbGhL+8x4o/uZdHbPsZbBWKhuEyAgsyupDjZbAvanMFOp
	G8fEHsxFSMkb9s3fEhf7DqyC9n8nJKFTp+WIDvuoNLujIGaCtkKsaG2uf1DXiPzQPHA7gkF24CN
	tXd6TdDGKw/OcRgKDCZcJBH2ulMN6mxo1r52oosO+3wkJSWxe1AOPEqY5pL/efURik6pueidj4J
	F5kKJjYvIM8PaGbZgT95VSpgT+WTt7jgjZJY9mfZRwSiswCFlTxbq59JVm4ylOT2KyNuCNFK6oI
	QMquVCFYlyNcITiv6U4A05Zk/4bPckiDV6YhNAjoNfqk7Vx+f/GdlFJsXyzz8/FZrLojRqpI3KM
	UZIxHHOshamNnxAgNEVqjlgkH0eHxeWajvIkjSYVnsLFwZ50Nv+oYmMCSvHwgu02w2YjO/aWNVY
	lezIfBJ//F9RoOOB/JNdu6LXjg7fY3xAsqOCa2ouKGzkxV0SzFQKKgFBZsuDSjzPOdsDLn6r9rm
	q91tSdMVuH0i5vOkvBw85VqLv+nL45WnDeQUiwmje5O4fHA==
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2220289b3a.7.1794566269836;
        Fri, 13 Nov 2026 02:37:49 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:48 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel-classd: Improve clock and probe handling
Date: Fri, 13 Nov 2026 17:37:25 +0700
Message-ID: <20261113103727.30449-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_023750_792839_0EA1E22B 
X-CRM114-Status: UNSURE (   6.97  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies probe error handling and fixes the 
peripheral clock lifecycle management in the Atmel CLASSD driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-classd: Simplify probe error handling
  ASoC: atmel-classd: Enable pclk during probe

 sound/soc/atmel/atmel-classd.c | 42 ++++++++++------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

-- 
2.43.0


