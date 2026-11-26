Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zy4skgLP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6dCFrdy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rjO4Z9fnGzJyAT3zi59WpM5QjCpGo5vCmcnuMsX5xB0=; b=Zy4skgLPPZAZ8gPWyTqSCs5Ujv
	btIPTE2F6pwchbYFSI1F+IynLwpDP2hIQuA5KxmkKaeQoEsqkPiliU2mCw7Pcr/e6PM5CKUTfS4ZE
	JCJucf/DMOarURuobtTjinvWViqXmspMqBflamc2X927Y8MrtLcnlx3fWVgwXUXpK9k9r837/fRTp
	PTg/6I9NpAw/IIL1jVpaZJbd0LVRA1rSugdf4mfqWuW7zrBkK2qQWp7Sn8aiDQ3gn8KSXi0/ckbhR
	lb5hfOrhnycx9mfPqNe3opafw2bGBHP8pFDvuEU4tb7k80gxHIiQxT19rZiu8D7cicSC3iFH0mjWZ
	rDJ9DpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdp-0000000CWKA-4BAR;
	Thu, 26 Nov 2026 09:19:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdZ-0000000CWC0-2ea9;
	Thu, 26 Nov 2026 09:19:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0653B408C0;
	Thu, 26 Nov 2026 09:19:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684768;
	b=ugT8VNumOhl71Pvi1B9ZwWJ84VHEinQIdfWK1zBEOLJQh0QupSacXsbb3lrDbQafVpKE
	 hV6QCsiPv3MmAqWLutQbWKSoFxIguVYduOjMJS2oWkiN2gBVA593QwJ0v+YwKBPNFSKcB
	 2+/eo8TBWhKfexo24PrZZnmrcpxZ9vBl/HoXbCbgspf1Z07U1xew+J9VgMFhbrgsdMwbx
	 Er7LB/4pVaYU7ZNgoGiNSjVQQGd5TsWdmZwZnupnbQp+vlYRB7RnQ8yLGvugqFngNqxVn
	 /rYJZWUdPjFqTrI5iyFsNK2xAj42RR0gHPn+PIMJ4CFgVAXMWDeOKAandW8mNG/qXDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684768;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rjO4Z9fnGzJyAT3zi59WpM5QjCpGo5vCmcnuMsX5xB0=;
	b=CLWqOjjKLMmMaK5AgnmBAzQxB3DfM5eKlAxBFqeZKEfkAh9Rui5qrwz6dyx5xjbtQ0uT
	 U5TJvRGoJg4MAbaBwaYWwy7TlwsVAu/KXpu6Z8jg6c1Q24cePpBGVfB07Xzo4FfOFEO8H
	 CmwEfHe13dKcGl+IVzEYbq5HU7Q4IGbAg+a6gaSZzdBuE2psOBinsKqa2W4ceFV+OwqAk
	 reXmOE7r+0Mou+eSQ3bwqpY5N2uFKuehErf6Omj2QGARFje7JlpjE9L4uWDJUVNNxBP2a
	 0TwRE6LDAADoFxMHVKCS3sY34XZyKrsJwbP32bfWBNm00EI0TSm5iIG+TrOb8UWIAPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52D0D1F000C6;
	Thu, 26 Nov 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684768;
	bh=rjO4Z9fnGzJyAT3zi59WpM5QjCpGo5vCmcnuMsX5xB0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=h6dCFrdyQvdiJ3okXT5Y4qWO9wzEXpRq7jT4IETmB8lcI3/h9WI9mZlgISFUwZEJN
	 ES5/B3SFlevbj8p4mHWL8AW4xEKAtCpyOdGUmFeSKEj37DKNT57qxkLzdGntbDOTUl
	 Da+J97R63oNKuhxG1SQGKVcKUJiDt7hVJgwO87K8oIi7ZT7/tL+95oCc+lUfDs5H1P
	 RT2RByP3Kwx4Nr/vh8J8ADV6dWf9Jkhi/nIuAInpyY6rpLgjApafsFMKcS9tqpIfGZ
	 VlSgUUNzixUoVjAPMOp3p9wAzFxZI/umVy1VhIUUHSi52tMN8Ggif/5F0Z/O84g//w
	 YMhrhifwzdcCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2BCF4D326;
	Thu, 26 Nov 2026 09:19:20 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] usb: typec: Find a Type-C partner after a warm
 reboot on the Orange Pi 5
Date: Thu, 26 Nov 2026 09:19:20 +0000
Message-Id: <20261126-tcpm-attach-reboot-v3-0-1c97dfa5024a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw7CIBQFf6VhLYZHH9aV/2FcwIW2GFsaQKJp+
 u9C3XRhXE5yzsyCvHZGe3QuFuR0NN7YKQE/FAgGMfUaG5UYMcJqSinBAeYRixAEDNhpaW3AquW
 q6nhdEi5ROs5Od+a1Sa+3L/unvGsI2ZQXg/HBuvdWjTTv/gYixQQ3ddUAUM0UiEs/CvM4gh1RD
 kS2V7CfCpYUspRQgzjxsiV7xbquH4Iq5u8JAQAA
X-Change-ID: 20261110-tcpm-attach-reboot-d93d5f36403b
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795684760; l=1385;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=O8mJr7+GZG2WrudGQ9eZZi1UioAIWkg07uAFPVTyYSU=;
 b=GA9s3Yl1E+f6Nk1yfkUbft03ym7vcUn4ZSTL1j7Pzs8LGaQ6jkS+AQr0uamuXWBhYGc9IiOYg
 ft/6LOPSeyHCD2EFF8mbH03W4AUfswZ2lTkN1cZBWewx/Q9dyAvEomb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After a warm reboot, an Orange Pi 5 (FUSB302) often did not find a
USB-C to DisplayPort cable that stayed plugged in; only a replug
brought DisplayPort back. Two causes:

  1. tcpm: a re-queue at port registration cut the 100 ms
     ErrorRecovery after PORT_RESET to 6 us.
  2. fusb302: the chip never found this cable while toggling with
     Rp 3.0A.

Tested on an Orange Pi 5 with a USB-C DisplayPort monitor: DP alt mode
on 16/16 warm reboots. Not tested: other TCPCs, ports without PD.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes in v3:
- Patch 2: Cc stable (Heikki Krogerus)
- Code comments dropped, shorter messages, no functional change
- Link to v2: https://patch.msgid.link/20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com

---
Arun Iyengar (2):
      usb: typec: tcpm: Don't cut a pending state delay short on a re-queue
      usb: typec: fusb302: Toggle with the default Rp current

 drivers/usb/typec/tcpm/fusb302.c | 12 ++++++++++--
 drivers/usb/typec/tcpm/tcpm.c    |  5 +++++
 2 files changed, 15 insertions(+), 2 deletions(-)
---
base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
change-id: 20261110-tcpm-attach-reboot-d93d5f36403b

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



