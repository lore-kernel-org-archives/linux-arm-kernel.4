Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSY7sSTw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MT/Tf1tV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=; b=vSY7sSTwK48Ntu
	PoqPRXg5gv9uA8VYiecuZtT+f8S8+JV1S+xZyMFS7jMpU0runqiG9/ll5pomqH1HujakbKQi2Yo9L
	fRtmFcEy8eitN5yPmFlBhij6DnMutczTkaJFgxObwcdE37Fz+F9CUyKcGTK04dALi/pQEHmIyB/Dx
	UihMqIKlMttvhO6mNcQY771ycDQ8ZpUNt6zwqTQeeH9BP1BTufWu2EgsmvlLUMEG68OUJraNb6kKd
	Unuc/qxhVyp5pMFt/zjoxHt9LSygacVTx8Vquo+KE4HruDMfUHS32vUC7P6nKUKHcOCebDXgGkr8d
	ZRkwy4qfWCGnWgsE8pWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBy-0000000ETvX-3o6s;
	Thu, 26 Nov 2026 20:35:42 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBt-0000000ETsj-2zad
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:35:39 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-717080a2d50so6795604eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725336; x=1796330136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=MT/Tf1tVolKPB2fzu+OA0e6ctUx4AK+2QowvBdx4eQW2VJcSf4T6VSxuKzfOCphAWo
         7rg3tqScY5Sr79Tpt2O0lRxvE2na1mN+rEXvfZtXV9BFLVqnctz4O1cFI9/XLHQoXuwW
         2KZTDWbNMu/34A1M+Y5tfj9c8ohEW+l6cgi6110PU8bK3EhvZTi5R3LdsU0Y4CfNYT9c
         tjwp3v4v5YRuPlLyP2jRCbaGarNzfLR/9AQpJkN4P3Gzbm8WyCJ6ivmPyRBscQIQt2IK
         BJ9FlaV6MztfShm049hKrVbCTxrSEWYjQ9fukRcNE7UW/jKc/AT7TIizkT4ngjwgquEg
         oKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725336; x=1796330136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=GQD6qLGK20c8/2v+0EaUuO1k+vB2uFonf5dS5Fod4ypK5XRE1UiVcmHmpC8WUCGtE+
         efHfjr3ne/NCBxIoj2zT6GKYxpXk4TXtudnMGiCKKGPudAMCRyckvezoAiPyS/V7Laca
         NJ7u9MNx8rMMwkSG+riqcqMjxLaSMxkVwzI3pi5TLrjB5Lgls5I27hvUWrz/fq8iOsq9
         CqqBLHNCwjzzFpvQqvzZhSpEC3EaIXSRcszjnrXunAbYkJd0uslT9Ghd8UJrAPJvYvDq
         zanEnD4pg1MP30JqLRAghZ9rba9ZRj5IiD/B7Ev4msjUd3eTKz1yALoDz4I+CBBZLCuQ
         fgyQ==
X-Forwarded-Encrypted: i=1; AL+hErG7t7CL42lulNrCh6H86YZQwYWYN2t/LktApX8GniHnXONC+uUL8kGrOpgZLnPZlXus8GArOJnqHiGZ5ZYmx4vj@lists.infradead.org
X-Gm-Message-State: APuU4Z+FqOedPHK/E3PUXdogiEjnx6XVzbAU7ZzFqLDPWHrq3F9kQgaW
	jmPj8IQYVIWfHEy2naulasnMLPDaSoE5IWeDBKYV4aWh1jq3E14rkU1mF/30JPQG
X-Gm-Gg: AZFdTZeDH8TJaYClirlaDbN6FsJrscFzSxr4JYN0Quyz5OEATYe+g4DFqWZPRao4zrv
	38atQ4zkjo4MTZeVkXRKuJi/kzv+YvYrXIfHXKkygYR3HFpO6k/YQk+lGbwfMwIXmbdL5Wl10Qg
	mOiPwnu6DqtxfaOWX/DS7ehDX+WYKAScNN3UPM5i9jFMMaTG28DmIfuowLf53f7x8WqsVvn+LhH
	Q0xVfSuckqXATFCGrZB6PKCLMFNmL8sg9VqoZkezMR63XaLEYP7pMQbPdndwUFsZk3NqIUwzryu
	U5uqUkzG7s/zrRckbu/HjSsmiRCpjUOO32x7rL5du+jjNqTwsOylDADJ2MBcM7hKl/DlLK+MCI8
	KCe2JxWpD8WUA5ZhoWxvPr4Biflpo7C6ff2ksMQKm6/KJhJ2DS65rwfdMEp8rYwGz2jul2E0w0t
	YlV+scI8oZFNp+UG6nNJwvQsLk/tQHr26M1UuWreMk0dmvBTr0NC8pySrqT4JWNVU/ylFVLClfu
	5sIzN8tKrwPzi3rsDyuB2D7+S0dgyKEN5JibL28JxxvWiOzEYHG5o5ZbYH0Dwbv7TqrvyELlLb7
	O7VxGfZXP5un5K3eow5rYOieHCGrnhyISWyPdgGqH0ncV3acQl+yr4qM5OlEyuM/gXpsPQVcXEq
	SCpVZJwk=
X-Received: by 2002:a05:6820:61e:b0:71b:7883:8d89 with SMTP id 006d021491bc7-71b7883ae62mr6639742eaf.66.1795725336439;
        Thu, 26 Nov 2026 12:35:36 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e5472sm15740888eaf.14.2026.11.26.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:35 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
Date: Thu, 26 Nov 2026 15:35:33 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123537_764762_5DDD8168 
X-CRM114-Status: UNSURE (   9.71  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
SoC compatible. The initial device trees for all three boards are
ready to use these entries. Radxa's Linux 5.15 A7A DTS already uses
the same compatible pair.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since v5:
- Fold in the A7Z compatible from Vinicius's binding patch.
- Drop Alexander's Reviewed-by, which covered the A7S entry alone.
  Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
  off the combined patch since it also includes the A7A entry.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..7a7f96f21f57 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,21 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc


