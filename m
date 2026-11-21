Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A10606A68A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWrXoBHf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wifND194
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=; b=uWrXoBHfBMdJeM
	+oMv7S0pOA794DCzBvmUZvp+zNRLV4xavdNRhUYFWY0W5lTpDQWsDMO3J/p4kcLTFpv1j4pLz+t2S
	eFhyErVrrG5BTF2eBE6p95Izy2At27PJDEet+yrSKH76wWv/xopSMDDiraZixlFW9PcFfe7x6hLEq
	01PF8hWccr8YkEI6hZ2ZdwItRMV29RkrKxksytWtKsokY6qu3uew8gwTyUcRJJpCmm1TT/zCDfLdw
	EbQTwr+qB5GVMEM6ZQWer+GfZZwsojpt4L4nTZCQ16W0Jsc6lpJF31Wg+BLDDtcfZucGg6axRXeBR
	3Rpo9HjRnStG+ZYeLjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZgO-0000000Gbn4-30cm;
	Sat, 21 Nov 2026 01:14:24 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdY-0000000GZcu-21jz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:43 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-55650fe1f0dso924895b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223488; x=1795828288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=wifND194wwqqQlTz88eQK1TpjcT9i1YSvwNfW+B69b4jVXhU4+GSW6TuPOe2QW31w7
         YOGKNvrD/hLgr2dt+nNawpfio/HIjp1A/5L+rNFP2nusQdmwdwYpaW+FmkrDeJOU2AQQ
         8NTGmfL26uT7mjzddq+v45RSsIBWrI/0fJrkJ1mO9o1CgQyldV/9TBV7oYn0QcbKMOWU
         rVZuvL1F4fzkiy9FZCw+DXhPuLyvBwTyA06qyy3/I9l1ZxyNha1YB8F1FubhmflPeT/2
         BsbRIEGoBrloNxAKDdrSYbliYJUMYbYOVHKSwGabdb7YsZg//8Ofm4MS5WfNaa0pB82t
         Qv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223488; x=1795828288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=ZXgS17e7IulSwu6Aup8iz8+eNjvjPVV4+eKrCtGhoK2EpiOve+QCeUZI4ga7CnkTTp
         EzAibzVLdFLuUAjTqp1Z/XazHbXhufo5N7QmrjISXVequQcIS6IN7zu2gIhlcIzyW5KF
         y7Oe8TvONX1CqOUbzT3cBdJhXwEGKd5nZj7lhWriYTMyzh7+o2j7YuL1dUjuKF867OWe
         6ZXVIQCeYIxxP+/dv6iKztyCPKR4OWy7r4nb1IpUyxCygIzr49Zlaz/o/TPE/9UvnfqK
         Bw5iWz1CHJJML+OoM8hKDKIPtzs1UjijQr9vQ5nxcN2FAhJmp8DXPHYHU5q1HIhNE4PS
         Ic7g==
X-Forwarded-Encrypted: i=1; AL+hErH26pGA1iQlrCrF4ytJb44OvEjTlBL7nJS36UlCLMI0RUWq9cpgI0aeq2X11W6O9q5GvMtncFYmfYfb/pfNu7BA@lists.infradead.org
X-Gm-Message-State: APuU4Z+kPx73hbd/cDeoTHSfGT0OnsZbm9jkqNY9AOJ66+8laQB2V/Ig
	U5mBDKG7BPxp7tSeYmNpjD0Vw0ZQcmreenWZbbvIfwGneo3W3S+XryrY
X-Gm-Gg: AYBFou1U/8cSA2KXk4RosCtseZJ/+ozm6CBGIVhbHZl3cRVXRtI7+2sN0hZ6/4f/F04
	Z1d5d4h6UgYbTUMiARtQdpbONAP7fUcN2qCSfsrxOb2MCir9y5UqeTwiuVwf9jjn1V2Z2+OW9hG
	qYK0dcE6N2PP1q9hX3Q3Wb33223x4lzYN/6/8eJ1o6bP1s8EQLcKre+d8CYNIPpFpt77q+j1u2O
	mwXsWL+Mhgay9fdamW30DAWAr6ORQ/Ux6j6rXGbZwiLUUJ/nqJL6w88lXO1pLmg5buMsG7GUQgk
	JEcllj4r4qq0BsP+hMlbr0vjXt1V0bsTpXHnvCtfPKO9yCljQcSJmvbaJimHL6XmD7EXumhBk2b
	cGqX/bktpcFoeJSiEunGZ1w/KgMciRKHGNG1ipQabUYQCpKy/oKmnI1PMMY/5QjVWPnT5GCI3C4
	zepi8P0e28/oMDoon5jpFy12/Uoa5GJhg+Bawr6Wye96btE7CNHxVDlVWoKRAGCE77GZR87DCHV
	RTT9FQFYPh9ba//7xGTMf22la7DRQxYdsQhm+HFq7jY2KFU33QERNNcfEmBvRcNZ/WU7mwNx/sb
	YYld/TCawK7HhplYnbOHAyTrxX0BOTHQafgX/+d9mGXPBNIDd+yY5HMxP1pO7T/t5Oy/f/8V5tK
	5/DCb8Rdi7nD66JKxV6dHFDLtG90D9M1pCyuTNa6+WPtFaQ6fdR3KaT8gfgYg6xb0Xv1knhN2rV
	NPDITKbALgTitg2K/TJqWGtWTwFefq7vP7NjZ05vfxHF03ccUoTBgc
X-Received: by 2002:a05:6808:2220:b0:572:e8eb:36a6 with SMTP id 5614622812f47-57a0bc9d273mr5655190b6e.56.1795223487680;
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:46 -0700
Subject: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171128_945080_3DCE3F08 
X-CRM114-Status: GOOD (  11.12  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Normal NAND reads and writes worked on H616. Fault injection exposed a
failure when recovering from an aborted internal DMA transfer: the
controller's soft reset could leave the first subsequent read displaced,
sometimes without an ECC error. This was not observed during ordinary
I/O.

The controller needs its AHB reset to stop internal DMA and restore data
ordering after an aborted transfer. Require resets and reset-names for
the H616 compatible so the binding describes the reset needed for
recovery. The in-tree H616 SoC description already supplies the named
reset. Older descriptions that omit it were valid under the previous
binding and do not describe the reset needed after a DMA abort.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0


