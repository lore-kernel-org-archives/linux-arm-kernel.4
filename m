Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295360A2625
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUAwby3T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFa/thj4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=; b=iUAwby3TUjS/7r
	G5O/uWbxSkNm/IIKdvLxTebNLFvt+kqdPOWcB8U1Y8Sy5Fx23bLPrNZUHRQGf4ha+3qUyu6TAb1gG
	nbS2VLT5Lp4yBUd8xFBekd4Tjt41jqp/Fsqr8UxYdHM7yBsdAAjytLW5cgo6DA6C9xKWAzONiMwkZ
	XaEoj9+67w/2vLSvNjwFInX2C4HmajiX1apPPLqQUAYmWxcAj9J1iVDPdcQtf5P1lLwq+VNjMXNA7
	ey1VDPNYJM9ivJIVo2bVh+N4j7OfWrvAP99CARmUPSu70v5LRdDCEsbv6/W9weYwIw9j3p8riQ7SC
	5IDpirktf9aY9mmUpURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSgL-0000000Flil-0mxf;
	Fri, 20 Nov 2026 17:45:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSgH-0000000FlhY-46hP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:45:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so685558a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196748; x=1795801548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=dFa/thj4IyONDIMPU+zFDxzEXX5jhFiEml30IBEbN9MQCq+0erhxfbeRwtbb9lPg6e
         1OiYBvrq/WotUdill7rvq5WzPuDaXfER6lhgD1vZMy6/rL/B3U0COuBVsyFNxzZJepc8
         X1fDgJrnrpvtY8rM1MYdjVk+/HwPF7wuJy9vWu96fXUgpRhzPlzvcXk848fQIV4w79Fa
         ZIRy++bmgWHphBfq/EyLjtAk9Nm696kDvjCtqXEF90sFkd7BYb/DQHf+ERmWrN092FMy
         /vsfRQ5PBqFnGt44fESxFsWeIxKYGST0hKTIGiQYOLqNuLXiHkJPRSOfyF3hdghdEfeA
         9nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196748; x=1795801548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=GpN/hvqMsNAQxyORMvFkZgtMwUBUl7BVh5j3oDN7f/OKG15gxSwXCU7gTKQbhgwTd3
         dI8udjkpvQAyWhOsUPTsP6sCIe/hTuZ6QcLufnW3/GBbSyzsOlGCdWPnUp7r62GugZ5e
         mfd97s/nHWELylhoa0fNgqj803H97wIPtaT5PmeehlJvM3QomoZJ02lXCfsuglhA6yKs
         ocVxQHB5XgWuw/vadPG2Br4/WpA1sE0u6ryKjx5Og3ecfhsQ7Fam9Mwl/Trn7CMODNzx
         2AWgzycp5AFpCot93EBx9Nx8ohbMVmGzEOzVUPbBcnbxPtiEGYqAzdlMknH+kTEMMXcL
         Mx3A==
X-Forwarded-Encrypted: i=1; AL+hErEfCFjEpaPrTvdp42MtDRC7UWtI5p0FX2yl7Gdv3zt4zXHVQlHlVW7P1Ci8rp/hwxw/4M9/V/fs5Ci+W9WLXvy6@lists.infradead.org
X-Gm-Message-State: APuU4Z+TjVYV3vCW5y+mQc2TXfMqdjUygz5rmoRx175Ec/G/XwJAHVv0
	Oq04enQGdkcfSsnuO74Cwxqx+YVCW1140hZkzkEMHI4mSIXZrjBJBgOH
X-Gm-Gg: AZFdTZe2PiP7tPVi0JY5wVNFfKHvfrUn+YDI/4q2ckFtkqEeHGywWH2SXh5YzhFupDX
	UoLN6etWp3IJfeZmAQ1JdJygD1CrND77g7o5thq229qcEqiRDzP9VJE+4xplqXWwVtuWeyPq3je
	jeNInxSFbZb77VVTNowc6Hybk/cV9p5t0uhLVJNCGVHl3nriUzj5gTkweqT/m8FW5hYh/SlGJym
	ayU0wVy/Mw+/XQMiXRhlmWIf998AQrXb2/+KsdxJ/oje9JkxXDf4QdUOM3Ni/Dh/oWnm7L83ggH
	3z13BFuS2wnGcRDD6W7QlImY+YHqsSh1HHMo9ELHjzpk/phlSeoVRJ0mwnMwjOIGepBh3PrPQSt
	xuO8qDg590HtAM36ZNM0UU4W+iAxBX6W4XuzVVH0WH2yJxrQUKgGMqKykcEszrnjVzNq7sntLsl
	0alXwDO/GZfgBzU2m8Z5DXL2z310u6iUZS8Vy+xxpMWLIldLFFHJK1LQ3uekwTmQNg7eduDbuXU
	4C877reh0TNa1bjKATvhqzNsfcTJakziQeUFj6uuTzf4VEZmqb34LACc0wlaj76pd6PuSfvfCAT
	9xGjMpBLqg7uBZ/sZtdHVwM1uByOz/lrUR8bW8Qnm3A2zT0=
X-Received: by 2002:a17:90b:3e81:b0:3b3:fd13:683d with SMTP id 98e67ed59e1d1-3b41cb1bc6dmr2684467a91.55.1795196748255;
        Fri, 20 Nov 2026 09:45:48 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:47 -0800 (PST)
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
Subject: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 20 Nov 2026 23:14:38 +0530
Message-ID: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_094550_035044_381EAC0E 
X-CRM114-Status: UNSURE (   8.83  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series exposes permitted AST2600 OTP data through root-only NVMEM
for userspace diagnostics using raw offsets. It adds the SBC NVMEM
binding and a read-only driver adapted from ASPEED's downstream driver.

Changes since v1:
- Add the separate binding patch and rename the driver nvmem-aspeed-otp.
- Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
- Initialize read mode once at probe and stop commands after a timeout.
- Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
- Simplify copying, locking, configuration and Kconfig help.

Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
and initramfs and also passed the final-pair comparison. ARM zImage built
successfully.

AI assisted with driver revisions, validation tooling and patch text,
using the downstream code, review comments and Neal's hardware guidance.
Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

