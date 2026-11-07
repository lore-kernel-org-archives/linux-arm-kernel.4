Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tvgFgIVD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n24a25f6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3B2bRBOpZdQJBdPeYcBE/ImJEUR7JL3p3x1iB3QG5Ic=; b=tvgFgIVD9BI8RV
	kgsTxg2/ZQm8MZWzLR+rZDfrWYAB2U47YfOgyrY0CYE5rYLCUf/6f18Bf1Rj0RSNzpkHny+n8jck/
	rKRRH3m061XDdnM4rStTTOzCOqokTvrM7qqNTn0PnFpIvfPc6Cpxo6u76l908mEPnBIvjDkuzIN57
	EtIFQxQ8Gyr+aL50b7h2V/lJaNKIZqlZgaJTZNyRJfJH+bFz2BeHHNTazYU2FwwVZ999zlkLZXH61
	09XQ2dF/LO23GBZF7F88OyNWf/HSnIskFmdNxI6QaPyz823zM+6xu8DSkJKfddmZ9PfG6R+f/gFyb
	iOdsMRbNuKJlwUWTnAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrs-0000000F4u8-2QiX;
	Sat, 07 Nov 2026 17:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrj-0000000F4o7-1zsR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 17:06:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F80B437C3;
	Sat,  7 Nov 2026 17:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745471F008A1;
	Sat,  7 Nov 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794071167;
	bh=3B2bRBOpZdQJBdPeYcBE/ImJEUR7JL3p3x1iB3QG5Ic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n24a25f6R0VawmmQunC0DW27O+t4E1QrIT8l8XRT2iYs4tZJspHBDBpnIOlPwmHlY
	 jGaOYfdBlQbNDIaT11Lfy1epWt9Q2Qj5h7ExuMRoZW3IYFhV5R4ABKltXvaX6KsZco
	 lTkXLbrV9dw02dmHUwcO0SSn5vNlYw7PjKxIak/lM1mFX92QNabrUPTfnpi9OQcRCU
	 CTq0JJJYBTQdsvpsWmW5/7zNte+g79lRNoK8BbaF9xBK6FAZtH9r2pCZQjCVFk/jVl
	 +i8Zek2m5hFWI1hhIOhAlTtrAWq2jE/E8myFNbWmcyaAZkJv9Mfrh/Ru6QsGTMfvxG
	 9ZYAzlS4wh3iw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eugen Hristev <ehristev@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103-iproc-irq-v2-1-dc7223df35fc@kernel.org>
References: <20261103-iproc-irq-v2-1-dc7223df35fc@kernel.org>
Subject: Re: [PATCH v2] PCI: iproc-msi: Removed potentially endless loop
 handling MSI events
Message-Id: <179407116636.87400.9305628985519602729.b4-ty@b4>
Date: Sat, 07 Nov 2026 22:36:06 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 23:20:12 +0200, Eugen Hristev wrote:
> The iProc MSI chained handler rereads the event queue tail after each
> batch and keeps processing until the queue is empty. A continuously fed
> queue can therefore keep the CPU in the handler indefinitely, starving
> other interrupts and causing RCU stalls under heavy Ethernet traffic.
> 
> To fix this scenario, remove the loop that keeps reading the head and
> the tail until there are no more pending events. Read the head and tail
> only once and process only the events recorded in that snapshot.
> Update the head before returning. Events arriving during processing
> remain queued for a subsequent parent interrupt, allowing other handlers
> to run without imposing an arbitrary event limit.
> 
> [...]

Applied, thanks!

[1/1] PCI: iproc-msi: Removed potentially endless loop handling MSI events
      commit: 2fc457946ee05dfdf080c35e084a9e136e38c3ed

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



