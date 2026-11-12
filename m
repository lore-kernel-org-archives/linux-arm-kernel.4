Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vnE4QjE2;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=chkLStSQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=; b=vnE4QjE2CrtqiWe8T+qeHqIJ8i
	SpHj9Bh0SwFQ+Rn/xoV0WKEFHRI8rhzAUHsgJdKx8SNG/CZn1SDMRu0UiQeRVUR24hWZ8nDnJGa9R
	XfCIumwNYh8wH3b9EOG2NXVdzs0poste+xuJcZnqqvxH+jIV6j8VPsBUcVWyJIg7np7mmReFc+z01
	8PNRACfugKXfwWVVHTbdI2S7zWr7RJjlVN0lXxptp4LpN1YH8Wo3/z3pUHP5BHzgcRZbRQEnbUjG/
	4LiGknvw19c80p0/WeeVRwS4bjwECO4MneU4VGUa4CAcV9wVo8XAaXuHlvqfrLKu5taT6lI/ijFPd
	3sO8crwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTA3-00000009kjm-0Lek;
	Thu, 12 Nov 2026 11:40:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT9t-00000009kgP-1ETL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:40:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so36323065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483599; x=1795088399; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=chkLStSQLdNQcZCbt9JxnMnXdXRcS7LyLedDU2X3ssXY8PKgbGBGZuVhnoTAVwF7rD
         ObRn7YVSLeC3CbmGSjgj6Z4C1zZ9drp8bMraWDNWq1m3i9ROL724IrQJRpxTVIusPPeA
         zGWzqiVMc1vuEsjzNuIBKt+XpJNYnuiDkpBO4G6OqQVvcGV9n3iDYwhdQIkU6alkis+j
         MO6UC23e8rSwiZaBud4knRDvb+PvRuZB4Winhw/AroxRofRXirJW6jxX4p9TE6h2Yx/B
         bnBi3wMSVpSb9Ohkzaa9euyytt5V7BCRH6zg6KkJwMregVOyEwnOgC+0uHgp1oXVL+8n
         Dbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=2sySQyHmsmdb9Mq5n3IygePTkp7oKRuYWHtwsndmI9vkx0ksvjR8QvADeUgtpIhnIE
         Gl/ZbKW4nqvR9e6Lzg/hGRp1tOlnjia8fWfHajD/n1uN8fK2b1FEm9LXv8KejBnmtZrJ
         c/nCRIpuAE47aSjcIWmLtdldQD3QIg7uPm0CFO+zmZral4VeUCbQK1I0TxqrI+Y1yZn9
         tyf5LY0uJ477tvIEyDrBu/h87OSBmNk5lIab6DmBbwmaLeaJLJrfgkv176ZWVFVfnAD3
         EdejMLacSKR8gPqSYkOmDNbxn41ScNl3V0vtlJ5kMyyViWD6z0wQkd8Mr6zWjmVWfAZw
         xs0g==
X-Forwarded-Encrypted: i=1; AL+hErE5Y0d0kA9kDNP3uxX4VdhAMGtXyY9OlflRcb9WzX4NzCapDNOury1VQ2x5tVvN4jLH/E0yI5IsVz6ZpbQwf5VI@lists.infradead.org
X-Gm-Message-State: APuU4Z/xx+8FSmyzaiBsDtcYOKYeDOkuaYl2Jo0l2eRZtO8y7QANbZvf
	QU4+KN+JuSv397xj7bZ6+aurfbvus84E85I9JznwSfnf9rsfwAfrKdlKJ3SC69pKpak=
X-Gm-Gg: AYBFou2Y4ErL13ygfjMJzukzuhrk2orm1vu6tKLDq4aHhBhBBs5GtjSsq3w7S104W9/
	/ELoYkQBHVod+LwsyXm2qPVmiP+xPf7Wn6J6kmyMRRfIB9wE5EpOKaxpzrLNl4NAJksXH0NCcRL
	Z0y14moZ6fk7/OqlWPQw16LA6vsz6H4ZQhnEkk5IcGVUCcoINiOYgb7SmXjuH/U5OLJVftDzhQQ
	LAXuYKHT5DyUccvnWKxrexZD9NW+ovGLrn8r2jnF8R10TAzCeAosuP5QuDU9GcbVMa7YW64bevR
	ZAyh8Xk4VLYvBdwXVYXgPMvOvIZ4Vqn+Wmvnh3lMRUuJCZOWZ1hFJytK1IpgwRcyHYxFPZHR5JP
	S1NtLDO4JQIoNSoIk56UgKow/wXHOGHSaYOpxtlP0aBgj2dc2RxVrnyj8Y0944e7THDzZXmoyRe
	elb7iUESV0qcMtC6+7j5C70MLQ2sGbbczRxs6z55HF/M2R6w1RGtocpy09OuazWZ/w3DN1h6l5l
	H8NnXtIuFZgYIyNjAJfo82QvMZGyHfLzkgzaHR1Ehg5ShS/X6XPyNShAnYXX14/2eXXCGzWJpRH
	SqS1nRFSoJ7MX8YxGf4Q5HUAcVyEzhqom5pHLhhfzgtbCf+hFNXeIZjyqS1M4x9O6o0yN810ugv
	e6j9FT2G0uiyNkwHR
X-Received: by 2002:a05:600c:4f81:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba093605c2mr91136455e9.14.1794483599210;
        Thu, 12 Nov 2026 03:39:59 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09509c74sm72110275e9.2.2026.11.12.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu, 12 Nov 2026 12:39:49 +0100
Message-ID: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rpD3ZlQEIotpmgm/8a/F0GE3kt8iCsrVMvUNk750HQI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV0VygZNHI2SVH27/dYSxqTJjDlywp4XNFMf BZVY/583XSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldAAKCRCPgPtYfRL+ TtCQCAClGYs+wv2wyzDrk/79LjPZbrJxNoTbgGZjAjNL8eGW9gHs8Qtu+Ul38KB+Yvlx4MgtF/v 68QyYlSMuYHXaQbGbOS3caVOpqAhhyFW9mM8PzK7wng3qCpRW2IfG4zk8sJ/b7sHISO5LsW4Q2Y jq3i6lhqo2kiw+dw7eJbkLOANZ2WciwA1jE12N3J4FGVwH2cLPWqU99eaaiq2jvcq9iKdY8wF3G DVlNZUgZMzYirkj6IRVOAVLsmMDsQs6BRWvaWplf/mr1RgAw0UEx47fAFp0XNesIZ3AoiCpDO5F Ee1FjbOjYKH4bwaNPe5ccJau4Aiy8JQCTn6mUlgyP1PvkV3V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_034001_379912_F44DB975 
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Changes since v3 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):

 - Improve kdoc comment for new callback describing what it is supposed
   to do as requested by Mathieu.

I'm currently working on another remoteproc driver that cannot use
rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
into the local CPU's memory address space in a useable way. With the new
callback the amount of code that must be repeated is reduced, similar to
how the imx_dsp driver's load routine is reduced.

Best regards
Uwe

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   7 ++
 3 files changed, 74 insertions(+), 117 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.56.0.rc1


