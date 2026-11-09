Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2BF606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0lbsnJF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GIvVzQAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=; b=e0lbsnJFZV1vCWOveJp8ZM/nrg
	CRhSPo1UUw3K2YfXg/cY7rIlFIquTTx5/MuUG533y9f0A+1UWzvHRP83NRxgQLZ3AaDPZda4eEv96
	HGAVbitGvT/JaLq4gU9Sg15V9qaHwgzxM7TmkLujVshJPJ+tmjBhecVowyLgvPGqlEstk7ItK0wCR
	KgqiwGW4SdmZA8nfdnvwd93jbPu0gdpLhiRuk1WVcBCWpVW9GEEXywerwf7OXSvFAk+aZOhtWAQZM
	JkC7uRELQ0q5GwBKNsABA0FEobrv4E5Pp4PopjYrTqaTMD10Xk2HpR5gieYPLscDjml3ZOozZEZPy
	NbvSU/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe1-00000001bza-1K9r;
	Mon, 09 Nov 2026 20:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe0-00000001bzS-0w3M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:07:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C69BF413FC;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254827;
	b=tM44VgB91l1lDECACOvhA7f2d/8ZcJ30pZZF3tY+nRoAwzzchAPLntCvEEiZxXElnya9
	 1u+niqWgKtozAeKqUPxp/9MIIoQjcDpdHTBVI+dEwOUeN5SvYR4vPEIwLZMWzZYb5R0BH
	 fMuPoERYYVWGnwAtSY0K71mweKDo/TnCNDwj7iFlYHywLCS+a0T48Ju8T4nPdWyrw6Nl9
	 9lwhYoJWwsn6B5RRLRIBxXFICrFSI5AOMWognpUgs9muuJgKDE8DL6WaBb4uMfu7MUXmx
	 U1PAPzSTmqd+GIgvNm1DyY9a6WxP+F32nItFfzsNIf+pckItx4eaxPZhpctaMGkSezg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254827;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=HVzr7S36eVVljLmyRIlIeckVYr3nU4Gy8vGeuhr4WWbeAnI0ksgvPSgDIfkzhSGP8c0q
	 GWvRpNKMqTfTJkQmciBCVSfRY/lVzwZQMtp54yBvjgQ1pWSMdGntLt3oZxFvpCDwopXcQ
	 7BTXjpDcMYfIWN9uZb4PWsSbUYWexzxeatf9ifYf+gZaI+9CLYc3hB08r3ZIOUr1TjpD3
	 Ibt2El3FQHAGCSeDZ51wQDCuipaKT50IHgwMBHDBVFIVZDCkgZI6y+WUYqEZePuBAu7Ju
	 kIYM3c3Kljo3VnNhaHsZ5MUDa5uPKGtXUrDHAbdLyr7AErZz9DSfNOzs4ncjI6sALzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 106CB1F008A1;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254827;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GIvVzQAszu2rCEhjy+keDca1R0NFGGh0QtWLCYwalQqdUEcLCzEGUGjErHNICmVLz
	 L4IvTt9vsFeDJ8nNvghd0QWuqAzXxzg3mE/GTEdQI2TrmX7plH7AV9NzrrPZNmPZiS
	 NbYSr6EdT9y1K6vj/B5TGzUDxWt6QVUU2S0A+krCYJN/OjQHauGGEzlcHJHsOaAiIG
	 aAQca4FDtNFk25/BQg9e+Su0xMthofiprbNnbhvbXCfokclSz2aTBHQ0XV++lZ0usL
	 dN5RXKWNwc31Mq3WsD6fK5PSUBKHHDWV7H4eN34F138QJXBNe+s+2CzhTuRQARAY7v
	 ZsvQYXLp1kjZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 822EC4862A;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 20:07:05 +0000
Subject: [PATCH 1/2] dt-bindings: arm: samsung: samsung-boards: Add
 bindings for SM-T515 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-gta3xllte-support-v1-1-dc0c4bfa8b44@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254826; l=932;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=rPHV+1f50EZ85D3csJMso8rMA1UhcD9FsDkCoV1Wx3o=;
 b=XOuWDcNOs8m+GJEgfb9tmoTv4apibIJ5dJIdge/oQlS3SGu2pm1t4v2v8wCnZcNuXa9uImopz
 +230PByXa6ZACljBVP6ehxeP9Ixx+kpeTmjb6x8MZcMJ5cNfxGuL+/4
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Add devicetree bindings for Samsung Galaxy Tab A 10.1 (2019, 4G) board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..6ac7f895351e 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -226,6 +226,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
 

-- 
2.56.0



