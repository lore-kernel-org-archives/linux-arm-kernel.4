Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D21606A8BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bNBFP4Q3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFWPJe/w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=; b=bNBFP4Q3yum6NpdDGuIIo30u0N
	U+FmkP1YG7EepqYnhqjxsxoJIwaqrAZI1y1wlt09JWKSM1lDBBud5e9I/UKgLZyK4efV/0vqFmqrp
	gdP7PbkBJKH9Va1q3MB3raYziIIQiTAyuryUyYLJFcmTrqmjpuWmyxgzegDtbcv2d0gLZPMOpceQ/
	5pyB44BY1PGigvEKknvd6FE7FT0blKg0krO+nSDeKLXqY951hvi6MZpGVsIQ7QnC+Cs1pCPNG62lI
	6Ff+KpLcJMgP+J07EK0202dZVf3EX45Xkj67i94bR2wMy60XBe2maM8bd3V9txofPXZpPVSkB0nPo
	o6UkStEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr5-00000007VVO-0gIM;
	Wed, 11 Nov 2026 19:19:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDr2-00000007VUx-2dOQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:19:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so22602205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424770; x=1795029570; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=;
        b=wFWPJe/woczJYUQZAkHskyIuLqmpmT2pNqgUosGO8x8ORYshW6qmmgWEOjmlL9WXcB
         y+cX66Z6mAeYMEaGFWmSHKPLGJwr8Gn+1zDqalSMBoLrKMwbrw8s4pPa7fsclkMcbpy3
         LIfCc1fpJq4ASR1HzMcjPj3iI/K6XocZOk9TzrL9KtUl734gDz9GZfKhN++LfmRiRZoV
         b80tUrQKzffW1slro3utLHEWNRHQtunK+Rpp45xjRVgiuk/V2EMT/dBSQae2UkWmi9W9
         lo2UCTLk9I7nntUIRFOWMr+q6Odt8Yi0+Z6R4p/DGjRbQz43OhY1Q5Di9uZ7w9LGCS4H
         iEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424770; x=1795029570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=;
        b=nS6DU2Ba4vQEJ+B9CojeOOwKI3bkK68cqlkSa+xL2eb1wqkqFNDUelgAAUHjiesdv0
         oTQhagNNaa5M4jaK+DT6kQ97fzegCet34PrgTOJlSYOYklxMV/xXR2hOImdomvo6etIF
         UIBrAh8L+5DXP41QonINl9t8QJYxH3N1mt+V/L/OtFlvgMXynxqaHGXGX7VEtSadbr92
         1cErTLPPNTwr7PY+J0oHRj7reNhGm5lLgmmiO6IhBXhPwxl9HFpsFuMf4xQbvamNw5VN
         KDY4XcMGZ71PcaWxvqXAtO2SeDsIrJ7X/FchM2hA2eIxohwuYqfvxqE7QDjq2Wvkw/zL
         Ni3g==
X-Gm-Message-State: APuU4Z/gZ+nXCNx1ZKY7TsdvTtQYkzHaRoEigmna3lTnlWxMrbjbItAq
	vwxwakjqxgHSXBBXZyzERAcsA6pI7N5YP9ANG8vGqusfsjOq0VqjASWj
X-Gm-Gg: AYBFou3N9FirevSlEjI2jhrwUPkVC45VXweQwLtwXZI4v6Bxb5b+M9MhIYilTxaBW5i
	BTW1g/Uk+EglQQ6kXp5IS4d1rhAJyA1fWdEB+E67P48+cMPMGGyNcG7QOwwM248J9PGOkjs8gxd
	+SXD5Woq/S5lill4ev4T1fZ/x9awJa6M8oxvNMSp1pFr1IgW/PjFfbvdlVNppvYbmmUAtp65WlP
	6seXDlxKd5KzWfGp2CKzqRGqZcemuLSyJIFIS0AAKA8VGM/AeuhPArYBplzXrlxjo9NU7LGxwZQ
	3foGG+COih37CI4tsmBZ/884uJApr2jnboUmegz0HmmRCUsJSwwkMxl+0hPAgAxQtIzYCY8chgA
	we/jf1sGPB4vQdEDGtT+VZs3TSdBCSEcwbYYiOodAYCgJL8mdQVDNWbmqCiHdiWhBIq4I9+AKDu
	fdTT2nbDS9a90lrxgZRa8i+ovFKMQbda7hOZ8vOsHsd73fp6Z5SIaNyhwrvz+iIdeq2mGngdgyi
	AGwnE7gKKQ+G1eNBNnHqwBcXhoy0qMNB00xdKQh97DESao55MS7bWqWEPTmn1TFhqdB++hu8r4m
	rnJu7vjOARvj2FceD7KADdc7ZKl9VJT4Yt3v8rAgEDKkM3y/Gl6MbQtwBw2vFjEZNf323p9+P8Z
	XzsKrRAc=
X-Received: by 2002:a05:600c:8b24:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4ba09383fd2mr55404945e9.35.1794424770348;
        Wed, 11 Nov 2026 11:19:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:29 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/4] serial: vt8500: Clean up the probe
Date: Wed, 11 Nov 2026 23:19:15 +0400
Message-Id: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw5AMBAAf0X2bJOWeP6KOFS7WJGSFpGIf1fMb
 Q4zF3hyTB7q6AJHB3tebBAZR6BHZQdCNsEhEUkuA3hsZSYEvpmaUc+k7L6i6XVVpJKMKQSEdnX
 U8/l9m/Z3v3cT6e2dwX0/pXvcF3kAAAA=
X-Change-ID: 20261111-vt8500-serial-cleanup-dfc9731edd70
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=alchark@gmail.com;
 h=from:subject:message-id; bh=+hTK6IV/HGfu+wOooMtgfojIoiSt4kZ6VzyBes7lhAA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b8/8cXvSB7Tks9tGwI4jm/UavM6m5ajuODAOsXU+
 rbAzPhHHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx12DZGhnUynr/5Nv2+WBIRL36K9a/RgcIl/NtMF6/4onDAZWVEtBcjw+k7Nav
 PGc1wDVh2ULzAbpfJN9kZlaLlDdPmaTostJ6xmg8A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_111932_710393_31603A62 
X-CRM114-Status: UNSURE (   9.16  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver has been carrying legacy vestiges in the form of a bitmask and
a local array to track which ports should be numbered which, both of them
not really needed anymore with DT aliases and existing in-core tracking.

Remove them altogether to simplify the driver and get rid of leaks Sashiko
found. While here, also convert the clock handling to use the resource
managed API, and propagate errors from uart_add_one_port().

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (4):
      serial: vt8500: Find console ports in the serial core state
      serial: vt8500: Use devm_clk_get_enabled()
      serial: vt8500: Handle uart_add_one_port() failure
      serial: vt8500: Drop the port index bitmap

 drivers/tty/serial/vt8500_serial.c | 81 +++++++++++---------------------------
 1 file changed, 22 insertions(+), 59 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-vt8500-serial-cleanup-dfc9731edd70

Best regards,
--  
Alexey Charkov <alchark@gmail.com>


