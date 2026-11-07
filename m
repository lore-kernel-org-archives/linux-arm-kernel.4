Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26155606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Msn4tqK6;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=pOsXGO82
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r398tx10WrCtcSUjo84Tq+kxAlN0I4nplPTtKINWzFY=; b=Msn4tqK6YoA1BGlL5iy7z8yjjm
	gIWlwWvpNgxMFfLRtLHRg+krSMQho60m9MJjpBbkqo3fc3gTbtKKLgeJCUZqajj2k9KRwGArI2K6H
	S0TGZTOBG7I0ly0N5YEyxqbTxYVwxqxuRwlDzDWi/vBSwCQAc2BmAuRRXVU1BInyBXz7u6PjMRIj5
	phQwgbQxMRwSWXSRd/S2x8Xukpms3Q8sLFiBukYlEKsP6f+Bjkh9qkbMBZC97bUoCZZe+mpK+w/j5
	+FOrYL9Lv1LRangmunK54fVNs8fFqeS+I+ulEHY7HjAoP+tXZBmi6iimAj28AsWl31v+SY8g84KO7
	lN2J6eUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn9Y-0000000FNBy-1zUA;
	Sat, 07 Nov 2026 20:36:44 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn9S-0000000FN9m-0pMT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 20:36:43 +0000
Received: by chaosmail.tech (Postfix) id 9069E1C8E49;
	Sat, 07 Nov 2026 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r398tx10WrCtcSUjo84Tq+kxAlN0I4nplPTtKINWzFY=;
	b=pOsXGO825d88dEM3x1B6Gep8E6WEPl2n3Z+KYYgxkGmd5eREcfaeILZzNqE0uce93QsQp/
	P0H6ggAiLqfM9JFBmGX6sIPwqKa9hqmC/6tV6vs+iQBJppaPFDo1jryTku2jIorL9fcOdD
	3YeMyEHgkSyIqhj4ZK/I9Nhng6R5zFw=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v11 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Sat, 07 Nov 2026 21:36:22 +0100
Message-Id: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23SyU7DMBAG4FepciZoxrt74j0QBy9jakQXJSEqq
 vruOEWicfFxrPn+Gdm+dCMNmcZuu7l0A815zMdDKRCfNl3YucM79TmWg44BU6CZ7CcF/NyPp33
 utVAcfEIPDroCTgOlfL6lvb791uOX/6AwLQlLxy6P03H4vo2bcelrBs/YQ0/omE0hssjNS9nlO
 O5d/nyeKOy6JX1ma28qz4pPgpNMCCQNb3p+9wZ45XnxAbWXoKJFh00v1r7eX9y8dMiidTq2vVz
 7en9ZvJQ8SBdYQq6bXq08qsqrZb503mjnhNC+6fXa1/N18dEl8qRIa26b3qz8w/2b4jWYKCIyg
 hSb3t69Bay8LR4saWDEPcr2+yH8BSA8BCAsPyAZlEGpoHn6l3C9Xn8AHbI+XP4CAAA=
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=2745;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=J8UJXr2R5t6eKVLYlZWimSCzQm+/CBY8f4kpeADoPpM=;
 b=asjcwNEIBLbbvIFYEr4+1mqk4YhMHNz7G86UUN6UlVi8U7LRuIBildbrNO3i/5ojOWWgFUXzY
 cfSUWi6fY3YAogpyw9264tuP7rSDRGL01pzrFfUOZQbHx89AQofK34P
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_123638_770632_8BD8FD25 
X-CRM114-Status: UNSURE (   8.86  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SPMI bus has grown additional responsibilities in the M3
generation, making the current driver insufficient. Add M3 comatibles,
support for slave-sent interrupts, FIFO interrupts, power management
commands, parity validation, and fix locking.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v11:
- Rebase on 6.4
- Link to v10: https://patch.msgid.link/20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech

Changes in v10:
- Just collecting tags, effectively a resend
- Link to v9: https://patch.msgid.link/20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech

Changes in v9:
- more dt-binding fixes
- Link to v8: https://patch.msgid.link/20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech

Changes in v8:
- dt-binding style fixes per review
- Link to v7: https://patch.msgid.link/20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech

Changes in v7:
- Require interrupt support on M3+
- Link to v6: https://patch.msgid.link/20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech

Changes in v6:
- Fix interrupt controller teardown
- Link to v5: https://patch.msgid.link/20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech

Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

Changes in v3:
- Rework interrupt support
- Address review comments
- Link to v2: https://patch.msgid.link/20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech

Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (5):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: Add interrupt functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  29 ++
 drivers/spmi/Kconfig                               |   3 +-
 drivers/spmi/spmi-apple-controller.c               | 389 +++++++++++++++++++--
 3 files changed, 389 insertions(+), 32 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


