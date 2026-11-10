Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6B60A2623
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tE97AO4A;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zp+qA529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=; b=tE97AO4AqMna2g
	nn7wQ4wCvt/DMqdEgkeK9u1u1ij356gVfj9ihs+HVWll5uQsO8arD0WMf/U543FNNFbTuLtXr+RfU
	pRX3XaAV2xA1oO748+0bOtd69Ln71es/yzFUxKMdgdlV/hhETPw6JCIUrB1tT/qj5Pn3XGbEJapQI
	hoDi7Zyu+5YFvR0qoBBz/rWD1vNvG58QK0BNWcNNl3KW8iF00Enu7UbiuJdsakrHqQUQsXzjBdLOD
	xtQ5Ulx00w3Xmw14o5bYrWE2iDqaYbbrjY93OWvhKCCaWkQAuiB/Xn57TPy+FbK3J935L82+sZVBU
	6tKId0Fk5UmtU4pA+ZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIb-00000002Eou-2VTN;
	Tue, 10 Nov 2026 03:13:29 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIT-00000002Eis-3sbf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:23 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4f14642adb4so872224b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280401; x=1794885201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=Zp+qA5294aS/Uvs4g6+MinnSMgUGg/6zTI2FUxZStEesTs2xS2UqbUFi6mifnLAxTQ
         Cs6hyyQVHRpNOptTK5XY7hGRQCWpsoUPHzPvESmuGZk93xVEKkQND5DBmCQAaXT02wig
         QA9DSs/QHW7lYRmx3BVWv2wZdFj3Ch6XKBtLbNewU7IUkMAX4k5AdLHaeoegQ3OZDMUf
         Uv4Bg6z4lua5jTlgoy7AlosELZkcNw+fNvbj0UZjK1EyiNPGzUpM3vGI6B5EV/SmPKly
         0Ahobwh2Jcvw3fy1PWk0MtiwBHSnyQ8Fy8mAIKY1vCuQX8J/HjBXeeZgNY/Meg/2kvFJ
         22eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280401; x=1794885201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=Ex2YDtwaV1ovnXIIkkAguHDSw1C8fyH0fkxiMkvpmpOrF0Ej7J/ri8+qZ5Sy9I6gQH
         2gLFjo0OOYGgJF3Iy4Bd7w0W6Z2qynzVhdnKVdvALlLYlf6NFKl3+lDGf/38Rb4jJ+ZU
         VfVY0l5gzizA2HXRUS3vDIe85MrGsq5PYzriE3+PtXbBJ89HI7jtFuI8sje/anVqFR8a
         wjbMRw9dPxRJShsQUBIANNLKKISCkjehbWPoJjIb1UMVn3YR4PaKj+npHJsL+7F1Zo0l
         i76HRtHjktTm950tR+b+w7bqDhWZaYqojryf/rndJiaYpKzx/X3ONGkSTw6jtLUwr4rg
         1V4g==
X-Forwarded-Encrypted: i=1; AL+hErFYaBBglW+69Nj4sjMl0nSF6HsbydwhCs3+YllIqcyduNyrFiGeFJ4fY5cZgKVN9UAdyVH2blvw6GavxgXTnHH8@lists.infradead.org
X-Gm-Message-State: APuU4Z9a3OjHv6RkQzGCuQdOh/O69ASp0CM3P9wWFf9SvL5broFTjEsW
	tK5D28nRawTyVyVgYHoKkRajYzbgP0TFx1iM7BRjyiQhq+uZdWuenJuv
X-Gm-Gg: AYBFou15CJNZEnw+kCDB9FCX8nSCUXHk3lIJ27KKCJOKxyASpPKMFoQ1r08ZCpbvSr2
	F7dwq6k1Ojhn0Fd167ElYkxewmOh1rtW0ha7GSXySsfMoZSrUzvtFxw/dXQvDQsDoIp3d+MDvqU
	UzD3kzsP2pWHqUwNOp2trKGM/woJ8AyBNypu6RPVQjunsI+ncz3fmW2Bb8JU8BeOzVQSHHpQMDF
	IJ6cE7qUj9a2rjw7hVOsHQMkYUULEhKAsKBmLex+Z4LnHO1xDqp8EmvOiyUy6r/6LNm9QYfzUzX
	Rho+n+dVEcp4OcDP/+5oDgC0sgVZZHMTxpohUdDCytOhjo2BCatzcQg0294ew7b7NXFxQb+wl7O
	fpgt2gj9dtuv/tZejEsXzbBtvtKHxhHRZg5l8Hp+b7aAB+inqQZN4uXwuLlChyFUVylf9ycgZNP
	plpRVqbUWB6WpABIlb20iW5Bvb1ImsWHzo3he5YjKGHtAV1i/G5Gm2gr9w+qsa5/vwFrwDj8MQk
	hU8rYNpIP3DRI5/77Acky1eWzevXzIsJ94TYF91O5IXkubnL7uZ6SBnWfJ33Kb+QZVuQjhpK3kn
	gQKAMM+xpx/8e5noYvytMdQJTKje0HPaFl4DYBhgaTi+SrPlGc3b368/45R7eWE3kTs3/38Dk/R
	YzlUWKRNfXlgC0sRXZ1dxxxvuvlPu8z0MrOaVBYaar3jLOnuBvz/hsUmOAEbrBnKE6uvEO8QOuv
	ey72tRcBKjqU1v4z/YSxI05QVdkVTjitnYFWTWYv70Y/ttOiKG9w5T
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1299570b6e.44.1794280400815;
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:56 -0700
Subject: [PATCH v9 07/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-7-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191322_106855_A0BF954E 
X-CRM114-Status: GOOD (  10.02  )
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

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


