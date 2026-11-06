Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B8606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mX1ywBBX;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=vX/Rb0HX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I4Bt2sXHgjM8yxfvtsqejeEaDBGREdupk+UhPUCAq8g=; b=mX1ywBBXQD21aOhZv1pGv152Ze
	hMWxXnxgPfFlpSXeUbB5K4mUDcouz94YwOUe5RI66GCv+D3VCx2WkqzfPOGIlvqF58KIrMfzoOsbO
	eOL0iUuLAwne8TQym1+7Q1wssu9rqfB4Y+p+tn7ZTtshB/grpkl+Xx9l8nnV93O8Gfua069Fel6Pd
	TuGaXq9h8yGwEitQUc+N+n8ihjA6VB1CI+FjSvUxmcJkwQ0WkqGF5CN6piPOg7pgaBR8ds2hfmILL
	yllLW4mdlpKlNNOQIWD/3VDiM6D3S/PXzAzEkvT+cnbh7hFGmThfmwJqp5c/GQS7QvUlcVsTa/ArX
	du3wAoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNF1-0000000D8My-33Ut;
	Fri, 06 Nov 2026 16:56:39 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEw-0000000D8FU-1z9e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:56:35 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I4Bt2sXHgjM8yxfvtsqejeEaDBGREdupk+UhPUCAq8g=;
	b=vX/Rb0HX5442BogFhvBqA/WpVt4Zza7HWNa4hcVvkfpgH8eLCC7o0OR7+3P1344gVRB5Pr
	yKSdLaIai6TWz3H13t9pqpKikF6zU5hbwceE1EePd3BylYRqKkje6KJHtCxCeBajNy+6Ef
	qtic2gwY5mJeUrlkjY0a6mgkeXQzQjY=
Subject: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
Date: Fri, 06 Nov 2026 17:56:12 +0100
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OWw6CMBREt0L67TVt5SF+uQ/DB9xepCqP9NZGQ
 ti7BTfg1+QkkzOzCCZnicUlWYSjYNmOQwR9SAR29XAnsCay0FLnstQp1NP0IjCeoU9jAPs5Mna
 ET8hJtaXBUp9lIaJhctTaz26/VT/md/Mg9Jtya3SW/ejmfT6orfffUlAg4USYZ8oUWVO3V5wbc
 vHyyEdDQVTrun4BWjghpN0AAAA=
X-Change-ID: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085634_694750_A0456B67 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
this makes the M4 device trees broadly compliant with
`dt-check-style --mode=strict`, leaving the same exceptions:

- the property-order and line-length issues in the generated pmgr nodes
  are left as-is

I checked carefully that the modifications do not cause any functional
change in the compiled DTs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Also fix indentation related dt-check-style issues (mixed-indent-chars)
- Change the ordering only where the issue is still present against
  current linux-next dt-check-style.
- Also fix any remaining line length issues in the t8132 dts except t8132-pmgr.dtsi.
- Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev

---
Yureka Lilian (4):
      arm64: dts: apple: t8132: Fix indentation-related dt-check-style issues
      arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      arm64: dts: apple: t8132: Fix line-length-related dt-check-style issues
      arm64: dts: apple: t8132: Fix ordering-related dt-check-style issues

 arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
 arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
 arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------------
 8 files changed, 109 insertions(+), 82 deletions(-)
---
base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


