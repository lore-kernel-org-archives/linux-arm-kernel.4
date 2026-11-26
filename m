Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD51606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9m7GWev;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWFpH75T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4X783mAcXkSHJGPRS1PqaX2SCx8TtwFkAQ4+3APQlu0=; b=z9m7GWevqiY1LW2FRqKk0f6TIN
	WClAqfJPP6w6lyq9MVhlqW3URuTtYO4HyjtlkLsfxPoLfSBDBI13OgQng4bKJB3JqOj4PH/Z7Id+1
	4impdNQSkvEo3CqqFFWifshCQUJzfoydl5tj6PZSPK4vzuAJ6MaI3pQH0gzTiDABsz9kiaAqgmazq
	9w8FhB9OUmLIDVMCMa4I0RQgG9WKonepQUcpgJ/PQvra0FaLxNMRWRnt12obzdi8sPOzEYQhrmvRT
	k+hI65VvVflO8tivXs3KoNRQFk7hYT31STM3ilOs3SlRpc29b3f4ogcnEHB8LtQvfDcZZA46K/3g/
	DoNo1brg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZk3-0000000DPgu-1XTO;
	Thu, 26 Nov 2026 13:42:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZk1-0000000DPgS-0rKl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:42:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1715400B7;
	Thu, 26 Nov 2026 13:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB6F1F000CF;
	Thu, 26 Nov 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700544;
	bh=4X783mAcXkSHJGPRS1PqaX2SCx8TtwFkAQ4+3APQlu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWFpH75Tdu3tO1BQHJN+rOTS7Ame2mO+5Licvq/tYNrg2DSEXo96wLm6JnQq6xjuM
	 9VZHKcuTI4vwZSu/3VneW0Eq7I15bKjQbPQRgSDOcKtEbML5U+fdgxHHJSKV7XMWMr
	 83RCC4QuwHOJJYbJXlVInnBz0XOJZ9Lhow9VfLQxVFFR4NmLYJ5tBsHjnhBizsnVE1
	 0vAPLr2Kzw4zMcRnir1iAb2nlpJQb/Ude6GozqCrBMbr0KonoBS15MmQriORnlc7CY
	 mEVL/yTmyUbnTmxcffxXhUG3hnz8N9G+751Tz+mIJvh0Mo4GQMhBGyQqXtdghQJ2/+
	 6UxhHXhMuF1Gg==
Date: Thu, 26 Nov 2026 13:42:20 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-acpi@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH v2 2/3] ACPI: FFH: Support FF-A direct request 2 calls
Message-ID: <20261126-incredible-python-of-honeydew-981b28@sudeepholla>
References: <20261112-acpi_ffh_ffa-v2-0-575a9dbed22b@kernel.org>
 <20261112-acpi_ffh_ffa-v2-2-575a9dbed22b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-acpi_ffh_ffa-v2-2-575a9dbed22b@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:14:07AM +0000, Sudeep Holla wrote:
> Arm Functional Fixed Hardware specification v1.3 defines FFH
> OperationRegion offset 2 for issuing FFA_MSG_SEND_DIRECT_REQ2 calls.
> The arm64 FFH handler currently supports only generic 32-bit and 64-bit
> SMCCC calls, so it cannot implement this standardized interface.
> 
> Add a standalone FF-A path using the existing SMCCC conduit. Negotiate
> FF-A v1.2, discover the sender endpoint with FFA_ID_GET, and use either
> the receiver supplied by firmware or resolve a unique receiver from the
> service UUID with FFA_PARTITION_INFO_GET_REGS.
> 
> Convert the ACPI ToUUID representation to the FF-A register encoding,
> construct the direct request, resume interrupted or yielded calls with
> FFA_RUN, and return the defined FFH status codes to AML.
> 
> Register-based partition discovery avoids RX/TX buffer ownership and
> keeps the FFH implementation independent of the Arm FF-A transport
> driver.
> 

Hi Will/Catalin,

Unless you shout, I assume you are happy for me to take this patch via
arm-soc tree for v7.5

-- 
Regards,
Sudeep

