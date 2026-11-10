Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B754E60A261A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y4u8PDRn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+9oHh1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=; b=y4u8PDRn7EjntE
	LIw9tLPUhM7VCje6BDWkP7xJcdEtoYbaNL0ij3c8VK2Ew4piXjyM/ZU9/Lo/vqons39KkXbrAcXw9
	QCXGPsqxxpxEHcOZcsz3MricYG8b9706T2D/KRd95TkeeK2zknP0X1MwPEuWRS6ZgcMCm/JUTpd5/
	mLTm+n/y7Kx8lqSefvpmG4iAv8+HwweHjBR9EWAOqMpSNftBsUGXatGg7prq1WkrAUTzi4rEtFbJY
	qG3JBz3xiRJDKfUEqZLAn/Aq5uVtbPrwR5J9d8kzDDSbnKFUPbtBzIlNhTl37Ez62VrRzNoa/O9fW
	IjCPihqJK76VHEXocRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIc-00000002EqU-0DMs;
	Tue, 10 Nov 2026 03:13:30 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIW-00000002Ekl-3rfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:26 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-85f39332862so653587a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280404; x=1794885204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=J+9oHh1SwDzW5gduPurrWo0LDL9u09W5JxUl2R328KjdeIKFtkY0IZDoJDqIKP3H3C
         xi8QNoeeHgFnjjSpQ5f8/g7gkiNdlu2bfnNRS9MzIwG6fcGVO81KtVglxlIyH0CkzqvB
         mASNbaIi9X2h+0iqmAmHikP8QL0uZ/kKHxN7Ub0U82PuiTnTqCbpABd/k2KgT/FjioA/
         d5rBovhMPnBfc51sMiRFODT1h3ZhUQ6VjspAuOBpdt5k45L8Pwrk0eq0i1wy2xtpi5jm
         4g/lfNjnwY5FxuWKBxcdjWWz9OI18VaB+gt5rlkzAgzIE6UUiuXLamBy2ZNKpM8Ax1+V
         FzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280404; x=1794885204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=e/PCH73C4h3+3DB2kgSi9FXi93uHsFLg+xYCGy6P913MX0sld0ijOHlDzwNCcZgxa1
         6zAIRz1VRqoBxS3Ee4e6ONqpW7xOpLnWlJA+FfzhTUX4bwK9Y2kDV4qeLycXi63BwaHf
         d0INYZhUftDpA5hRA+YSIGtwvt2RR28remBi+bbRGVSFkS9MiqJxeQ2jbSE1A7JlO32f
         TjGI/7EoUa1/j07oyppZb6NvFjlp6FZocWp1i38AgBn9IwIw8OFKo18Z1EtPsSrILqkD
         drhr+fVhoXRdaTiuC7Rx5uz3tHkHhnBQKN2LTBFhKJ/+1A66MOrHXPtnzPfQkz6w93q+
         ef+g==
X-Forwarded-Encrypted: i=1; AL+hErFiME5+ind9CXUh9Jq2HO15pn02BLUB1tDbAQqq8Dfx7e05o9xUT7EtX3mM7Xd7vot3VVYQru2U2YZI/cDVgdQl@lists.infradead.org
X-Gm-Message-State: APuU4Z8PInf/p3oI6so4xYIcTZOl8U6/WwdIh6F24exkH+8pxIzT7Qqf
	GE/8mDIr/bsSIOULn0cvMGh6gHEXMa6t7ik0ww7WeYM6TEgN5O9aji9Z
X-Gm-Gg: AYBFou1LAFMqjcrICvxEvagpoGz3OCypnEKl1+7jU4Cs9sVf2/uEBp46A1rRHK1u296
	g7o8KHK6JUQT9sA6VdgXiezfJU/zXw6U9fK3qC+9JDBg7iyeltrzBfFhbrHVJFzEDlHrRJSwxXf
	I+JILjHaE3o7SAms/0a2dZvGrVq/uUGyryeYAliioaU45O7cXntOc6mDi11PwF5YOVI97bFwqY7
	8O2xuA6qpRr01XzmK2fL0tIBzzhpOa2whi7iG30mykaHLRHg4b3w3RhJLn3YrLASjCr2SlsAks6
	6K9DFegHgQsXIvnPmKRv/aKp25eHKdiEKiijgboUoYaIBh7+i+vpgbseWu2JT15+D+PaQwg6vZx
	KZZA+6XBzETz4mlDhj2zpuiYVtOuEvW4/Pt+LI1PAj+yU0jNZ5R9GiHzo8IN6daVtU57Lh02IMb
	cIhlUHm0CFmeOTxxF8aiX+V1837m7886GyEXPXS1uxGXQ2eWS444mMIACcaI32SGh3oCcmJX92b
	nsYPzeb53EGcI6pgP+zmg6jUhhMVb2jhJxDG2k/fnx2SdpMo5eg5JA7hn1V4pW4NkCr74BaxrzV
	dJ/n6PvIdjCYNKT0sSJjtZ8LZSTxJwo9z5hZ44LE2MA1B6TnctV3OlAzstg1UvcIEy3b45joLd1
	2GM22cZ/0CO62QcYdQ2GFNq49QTOK930e0YSEcbrCr5nxPDFLGfhDp+c4WUJbTuZwvloT3lxkiz
	CJ2tuxqW9OQYSzIsrkK5DzV4I9kQeDEhvYurtDoZo0mTEJHHZmOfPj
X-Received: by 2002:a05:6808:509f:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-5683cd30aacmr1359211b6e.43.1794280403760;
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:58 -0700
Subject: [PATCH v9 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-9-3f03961dae8a@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_191324_973790_C9292A97 
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0


