Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5A0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZroClp8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEW8Rrx9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=; b=iZroClp8Bt6ll1
	3nY3SRwf+DE/xs0rQz+OwCwFvsMm5x8DyG8Dx/+YkE5NZ3W3YSmzvQD/2Ve9hHdzhlkUwszz9p6n3
	Seol3nwpjnUTO7SmBbpD5otTb4HTkljK5WA3hkZU8KEyoQ/vFrMDpc1dfWaKiT8OHUiBpEPZlEUtt
	+6weO7s0YuP/CQxecz1WVQBg0V2uaKOFexLDyFSv6zlPhuj4Gk6fvGG6mN7jph+h+582Eba2DagDy
	QEQWEK0b/ERB6uCeTCUpV0wmaY/aYUIgoaJURhpxrzjuh/A67VWg4iJEMCdGVWkaDrLcn0zPI4MtR
	UfhnMyi+48BvzKzC9M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmBI-0000000EokT-38py;
	Fri, 27 Nov 2026 02:59:24 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmBD-0000000Eoj3-2iJX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:59:20 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-386bd881d39so8137864eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748359; x=1796353159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=dEW8Rrx9vnqWbbyrnwf0AkwoODkF06bDBgEDTw59yNRbkZcvlhH9Hsd3hSGRyT/AEO
         zL7rhWhHSoy+jTocJtIxkNaFkefKpK9cEYa67QNNWzS/CXo6Ny/Xua5SMmwTmDCBcARX
         kr80nQ7TwJpEyBlicGUBSY8SFPYpfrzeAw1OsQcVCwJBHwoVrLR8GKIzPhbmt9CTII6c
         ZLGzkHGX6FBsI0qw4ugSgN8Ieqt7x92gIevIBpLpJaoFDq5NSxxd0/uHrkbsl4jwHgAR
         b8GmY9PcHnwb1IqfgIjY1xKzBc5P2bkJ5uxbDY8zHUmKrYaEVrQMNcdB0V6NyvY637r9
         7lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748359; x=1796353159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=uoAcjQ9J1hh7RO6isot4FY3uTgnDt2uIoihIq+WNxQ8EyRWAEa6g4iaJ45adJX0cCk
         HlFkarJkC1AsFFGydgmV32e9LX+HkBlnPJUBkg8MVCdgqzQIEbknxs5y3uWN8cd/C0nr
         RinsjjDea6uOkKHocpt+Lr88hOVs+lcvuWoMxJJpbWUkVYh/hqrFzLuF1ESQETaAPRIf
         sU+1G/eMVozY47KSjfYBDGRB17xKJ7HWjY3U0tlTxLZecXafDHnRgXdiNlp/VC/ZTFxB
         G6GH+AGlIIYsK0p5Sgqf0lYwds+iFmAdK8aH3CgRCwaO9TFUb9nK2XF41jMA4bGP2UD0
         P25g==
X-Forwarded-Encrypted: i=1; AL+hErHxt77CFf0qLNCuhsPiXkouDGfDdIT0nhvHNokMsWlncvNO6i7AULXyDTGMYCP6TJdNnaHLOo50CbUFMPvmu5S9@lists.infradead.org
X-Gm-Message-State: APuU4Z8iuJG2QgEamqcVE+Cz9CjvQsAi2LztR1EH/RTSXfB0af+Yz5rM
	GejQ2XXpcbi/R7AN1mciGvKR3p+RYFIJ1jLqan033rnmRffES7AlH2mr
X-Gm-Gg: AZFdTZcWFKcczeGBwxa1Je7lDtTU7zXL2aJxrcFK2orDUIC245RskJPRIvWKpY5NPmU
	MBizFTEwAzw7VyuDT14YUqxXKh954Si8BwOizGE+Mxfo+pl6/f3wl1l7cM9+aqYj5gNRPzRknOJ
	7h/V5J/hffNgeUEG2CaxjiAQY2eBhIIKbzNnMBo/BaBlZP2As3fFS6m3QHT5DjboD0IKZKNwDOl
	H8lhJnOkOAiXrp55mw5k4ZgfdxroAhyqSRj9TT8B8D4O75abIoiftkZyQxUmYNa3RfFMtf7b9LW
	t9SpkhFPTq9Gh065odqOW3v6NeocTSA87/wDeFtN4pyb3XGD7BeRmUlcYzMNO2v5L8CDUD2mcGJ
	e0kQn4EMUOZaHNX7xwQW6t+swOcu2RhMdepADtRO21MiTT/erZxV2e4r1bl+p1LNP3dk83T/Z3T
	KNP+b0QpnoNpNUurxuGtepNhC2d9NX3nq1jFOyK9XVrSTCdcUgMqu6ivvjFltFKWNSzo0ZY8p9Y
	JpzSfbRnob6mqsb8ussI8VfLzG3QqvH30q/Pi9v9niQXvjKap4y5Nwb1yMVzS6w/MylNzheKJAx
	KmRn005/oX6OzWcP7vUJM2TSysJGOTImGVXfMgsqtun44Ms=
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr27144602eec.22.1795748358624;
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 27 Nov 2026 08:28:16 +0530
Message-ID: <20261127025817.20090-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
References: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_185919_695876_E60D4AF0 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Cell offsets address OTP data rather than controller registers.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Validation: dt-doc-validate and the selected dt_binding_check target passed.
The binding target used dtschema 2026.4 with a local diagnostic lookup fix
for trailing # in schema IDs. No validation rules were disabled. Two
unrelated TI type diagnostics remain; no SBC diagnostics were emitted.
The valid example passed, and an unknown-property negative control failed
as expected.

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cac..d8e19c2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };
-- 
2.47.3


