Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF04606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbSnxivl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4NN1M6X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d8ZOa6Ph/zg8me6HR9Oexa2iZrXd/vZL36FKgzFT1zw=; b=vbSnxivlhLcoLlT3GYndbgvwLp
	nl6OT9sTEVrAa+qyiZbB0rN+x88sj2zHhHgTPwflI5Nuz1CCwB5zpZGCDVIH8Q75Juu8AMnl99NXE
	3yeg1eq28ssGR4wQ/J2E5Ka4wvDQ4LlY4jzjmXPhNh+dIXD7/htUavT3+KagraJQZuidIASMsuplm
	ewfsDhLA4C5ZEwwg8gQgfBnFdQjjiOf5tP4aKZjjWCVnBbl0OKRC0H5mQRZuPXvkE9tgfjsQGX7h3
	19oUM2mDbBYTAVMOwZvxOpTLIUxK6fMrM9immGLTHtbCB1wIagUF3a9+vkSZhHrdJGHf2IgIMpVvg
	8eCY0xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStmt-00000001w7n-49Qv;
	Mon, 16 Nov 2026 10:18:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStmt-00000001w7M-0ol5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:18:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACE8E40B46
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD24A1F000C4;
	Mon, 16 Nov 2026 10:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824290;
	bh=d8ZOa6Ph/zg8me6HR9Oexa2iZrXd/vZL36FKgzFT1zw=;
	h=From:Subject:Date:To:Cc;
	b=a4NN1M6Xry58G6kL3qkJJpj4e2sjuqXIJOAd1GXtXycZ5FbRCjxD8DTtBniF4s32D
	 Ekro778HzYS6UqUMvVk7Q+wCAwDbpiO4soLPdHZ/cg4hdX8Gocfj2hFOXJo+geHSIq
	 PmwPb7FE3BCKv/sjxGm7sjK5tSySluK+JauDtKlN8XC0eI/cR5ea4Yo8d8vWLi71c5
	 HG2gzxZ2GGQ7KZwVXZUb3H9SQrKKpVi05P5M1m9O52ddkNeQlB1Gji1/xgBE7Jatk1
	 s/PYqVL824zTfjUDizeibfzJCCqhcEmyQI8tKhnWVQkrb3JyC4NCzj7l3fq4TH3RiW
	 y5vzGxMlHi6kw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] ARM: dts: ux500: Convert EPOD consumers to power
 domains
Date: Mon, 16 Nov 2026 11:18:06 +0100
Message-Id: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AImolV5EuEjPVWTSRpLaCe
 Heh7wDvRJWiUuHoRJGvVs0JjmxDmFefFmGNcITWtIO1duD96I3hLf+kxPz2mjh+Kvf+4bsuRBN
 GQUPYirz0+L/T87puFC2/omcAAAA=
X-Change-ID: 20261116-ux500-powerdomain-dts-5a7a44bd0b8e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, 
 linux-pm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Rename the Ux500 power-controller node, assign the CPU and peripheral
domains, and remove the legacy DB8500 EPOD regulator nodes and supplies.

The companion genpd, binding and driver conversions are queued in
other trees to distribute this task.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (3):
      ARM: dts: ux500: Rename power domains node
      ARM: dts: ux500: Add power domains
      ARM: dts: ux500: Remove DB8500 EPOD regulators

 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 156 ++++++++++++-----------------------
 1 file changed, 53 insertions(+), 103 deletions(-)
---
base-commit: 64e2ab0ca7ac63f876e5de06300b6f033baf5e35
change-id: 20261116-ux500-powerdomain-dts-5a7a44bd0b8e

Best regards,
--  
Linus Walleij <linusw@kernel.org>


