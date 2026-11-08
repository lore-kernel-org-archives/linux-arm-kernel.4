Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E22606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oWudKOf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dbi7S7Od
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VZWQ5GPcnE6Q5UMFTfzl8vc+C5C5lDLasSb0Cus17+s=; b=1oWudKOfIKhKn/
	Edr40sVoZc+xV4iizAmvLwNhBgbrbnanaHhored50/drAg5vpEcj6x0OsUXgID1ODGZP+m1qPdz75
	kVDXpOWnYEqJR2AMT1XxSQl6EhyzxHjEtOhh0CDL1M9ZLKrij5mFoa26Me9t0KusboAoGelOPhsGY
	x11u9pvmYpgNYAa7jajC6YxzHZ1BbVa1L31WVrNeUKFOV2wCj3nGzNpnyj0H/jszC0NC7XqaO2rCn
	ri81Z1FMcX/tJEU+ghqpw8emN+DXKrgjTkGBO6vDPkIPP+osmdbmt4BFGbVzeo5YsDXi6TzTp4iHe
	f/7jiHXNUKO4wWWn6qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLQR-0SDp;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ak-0000000GLKq-170C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3B0A609FD;
	Sun,  8 Nov 2026 15:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D983E1F0089F;
	Sun,  8 Nov 2026 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153069;
	bh=VZWQ5GPcnE6Q5UMFTfzl8vc+C5C5lDLasSb0Cus17+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dbi7S7Od8niIy3YTv9UhSlYoV1xIy1/2pCSI9onoII46h/c4F6NOZcApQXltbWYOd
	 L60LAHTWgYFsVmUI7bp8J1u86MDoWRWKQIb08l/VtHXjfkTW8c5tR+tm8dEYhO0RR/
	 maAIEw27H7jxpmneLDkMVVriNLQcY5N5mB2EmO/ymE2BXdrbhXakaH2wQYoyc+eYWf
	 HBE3w4PI94iK6wQqpPynUzGvDsLD9joGmS7x14xTSrIIoo5Z7FA1W8LIFxwoT949+/
	 LRiwlA5gN3HXykbulpxYr3wJigKTVcIyFhctPpdyKEr+VfRPDdmcWBzTfjHp8qGi1n
	 LrD4+9Ee47cbw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:04 +0100
Subject: [PATCH v2 08/15] ARM: configs: u8500: Enable I2C mux support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-8-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the I2C multiplexer core for peripheral buses.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 924346f4462e..9dd60ff4192e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -137,6 +137,7 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
+CONFIG_I2C_MUX=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y

-- 
2.56.0


