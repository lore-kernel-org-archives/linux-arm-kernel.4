Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A101606A69D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 03:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfHW+aUX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCUfQ8zb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=; b=GfHW+aUX3Du7KcljcP64tnqH/0
	7Uhv5MjJ2Mk6Fr7lbu1ZhIK+SNcr7SrHRnyxfeXhUMu0egwgZqtiGCDEbqXsuoWqH2DYFMwwj1cuW
	OOWVNQP+MkfbZRTlqND8FSnlkR9dNdpKz/Dcc3QiM/1oHR0x8WPE6/9B135bpnYYJ/VQNkYignWZq
	r56DpglAmzTw0lQAzrk8qqXWJPyOOIuRA4cQ78CY1ynofmp0qv1uNY6Z48MyLDDVjdFUOzNUFDlSl
	Uu4G1SSJGJEEOP8cMZ//hz6E/BZ6chtD1e5yT85G8rEtfhneb8aG3sKMmK5X9zBo1XN1hvD4uNicn
	dbPtfHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbyv-0000000GjLB-2ncg;
	Sat, 21 Nov 2026 03:41:41 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbyn-0000000GjJZ-17M1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 03:41:40 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38431138772so1982732eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232491; x=1795837291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=yCUfQ8zbwDq9KxcSMfR8InZY5tz8xm4ESoH8upG5fwP8plKEWMLi1+VKuJKOglVBZ3
         1JsOp6Zv9dZOQ2zgtksI4pc1CtVwji3Pz0ShgK33bvI3m5GU7miJTMyIQNFSBMwXQ83T
         1ZAHmvMy7JQ9MX80r9Akvi4NK8h8IzkFTy+C8Iy0yX5j+bJg8wtrgQten/FRc+NmxP+W
         yGr7DSeuq1wDsTflABlmQjRmVk+HsoZfLofEQZ7fCz5TyDB/wPz3mTMTue4MrE3GVOtt
         Vo4ViTeLXmYLPK7kSYZV1BIjAFCgeozgsKaMmkUOP5Fo+UuohGWMpPMgpKSI+4C/alsx
         v6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232491; x=1795837291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=O9osQe+f8AtAJQFCb5OqC+1/YUaPG62yFbvyFi3y3PP9gfyPJHeZcy8gxkkS9tprRC
         gsLvbhE6+rNepprumLr7gxMete8lrGVta124qh9FyuU+RFy6DnxABNkoPSGIRx4K6k/5
         fi0j5BvXwcSDElH71+iktvGs5puv1jiIOx4JsA0S9y03RnZLPw5C9n4Yq5iU9HBRBGCT
         qYJQgTc6214LjPAT+19NBTTDNaGxzGMkIcKWlvGqDAQ/HrfjC9jNImzPz8jn+C+eo1Oq
         QGRivfX1MoDk6yXu7jOvLMvO3mh3rC85Gyfyuhi0+jT0r/KZy0uCHccF6BRfjizPcJ+1
         qyrw==
X-Forwarded-Encrypted: i=1; AL+hErEnNsIqwRdNWrqpUbw5E6frLbSjUINpWSw4eUOLXBagM+cbug/iDcFiVUacnWXNqHq9jniI24EGGrNSN7Mh00aE@lists.infradead.org
X-Gm-Message-State: APuU4Z+azX30g9vDGgDIa9xPRy981hzljDHWnx4sdoISJt6NTIWHJZ4z
	vI3tNhGGOGyZ1I0C1ni9s9PnTavGetr4JG01/5NcHK627vPH5CVO1CjB
X-Gm-Gg: AZFdTZec74fQO+sa/VzdnMcU9k++4lAozTMKZV555EGEgdpPSV2sPMl55Iq/UKUEiGj
	VPz1n9pqRt8FSk8QW+nZXfCJuRW645sHP5tzWs1b4nIgij65erTtZuoq/bVBosE4k6f1fZSFhVS
	Vv4opqne4rQnMMdTRXcrgLUesu5fytSOOUwCZpZJmc4IQpeXs8IqyevfBysbHL4emXM+moLvj6V
	JZNwDrH0LRJT+W4qdgf4TodOLeVBfQR+LZYrUvHryNxTszipVL4EJa1QJ6qjP8T3hQg0KRWiOL6
	qahKBhtVSBUSbwdUfxlS+4IAOdPZ6G+nzqZfvDey2ETOVl+IMH8vqXwDYPMNgA5YmySqx8rhIk8
	XYwSzjHpmhf8ueUgGiiEI7JiGqdqsLiRed8DAPS5WoFxhowTUMy7SEF5iYTBuHzW3o6/4tiVrsP
	pw4aByPVo04lJ5XAHpnyQ34u9v1c5Y8aE9c5xvGNUZsGQ1MJd9/r2OcGQcFOdgi0xMApeXsVhZk
	2fMgC5ZXRqJ33QE8Vg2Ef2jqVzAtyHUU4gzk/HlCZwu9Wy1kDuXJTivvS9mPxXzkU4gJaA6gjRV
	BA4/NmMqGkKsSRM8Iuh/eeRzb/jSN1jjkINq5YYkD70YOw==
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr4071171eec.23.1795232491106;
        Fri, 20 Nov 2026 19:41:31 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:30 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Sat, 21 Nov 2026 09:10:51 +0530
Message-ID: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_194133_324123_7ABB3961 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Add an NVMEM binding and read-only access to permitted AST2600 OTP words
for userspace BMC bring-up diagnostics.

AST2600 accesses OTP through shared command and result registers, so reads
must be serialized. Earlier firmware may leave the macro in programming
mode, requiring read-mode initialization. The protected prefix can grow
during operation, requiring live protection checks. A timeout leaves
command completion uncertain, so further commands are blocked because no
safe retry sequence is documented.

Supplementary design notes:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/blob/main/docs/security/ast2600-otp-nvmem-design.md

Changes since v2:
- Explain hardware constraints; put test results below the commit separator.
- Use generic ASPEED naming and named mode-register addresses.
- Share unlock/relock helpers without mixing scoped locking and goto.
- Return EIO for unlock failure; simplify pair copying and registration.
- Drop redundant MAINTAINERS matching, zero assignments and probe readback.

Changes since v1 (introduced in v2):
- Add the separate SBC/NVMEM binding patch; rename the source and module.
- Replace double polling with one bounded poll after an initial 1-us delay.
- Initialize read mode and read CONF0 once at probe; use a fixed keepout.
- Check the live SEC54 range on each hardware read in confirmed 128-byte units.
- Simplify word copying with unaligned-safe LE stores; accept empty reads.
- Adopt scoped mutex locking and managed initialization; simplify Kconfig.

Tested on B650D4U (AST2600 A3) with upstream-based Linux 7.4-rc1:
repeated reads, cross-pair/final-pair comparisons, 40 concurrent reads and
a 12-byte ASPEED-derived reference comparison passed. The RAM boot used
the working OpenBMC DTB and initramfs. The ARM kernel build used W=1.

The selected dt_binding_check target passed using dtschema 2026.4 with a
local diagnostic-crash fix; no checks were disabled. Two unrelated TI
type diagnostics remain, with no SBC errors. Host-model range, copying
and timeout checks also passed.

AI assistance was used for driver revisions, validation tooling and patch
text, based on the downstream driver, review comments and Neal's guidance.
Hardware tests were run by the submitter.

Previous revision (v2 cover letter):
https://lore.kernel.org/all/20261120174440.123487-1-prasanth.padarthi10@gmail.com/

Patch and review history:
v1 1/1 - original OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261113034213.158390-2-prasanth.padarthi10@gmail.com/
v2 1/2 - SBC/NVMEM binding:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-2-prasanth.padarthi10@gmail.com/
v2 2/2 - revised OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-3-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification - Neal Liu:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

