Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD682606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAmegBmm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMxP0eev
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6OcUjZbeewnbF2w76nF4BzgSzm7/aBPsfjvddk/XGKE=; b=BAmegBmm72Ozrf
	qGAL8B2Bpq9QxoC30BHCmlUUSIOS4xPazP7534VFEYBnWElySI/Z+b4xwBm7diM489VWP9InkpclW
	KW6KCxQjom+WZstXCnz5h7EM9XpxcJIHytbZjC81SldMscNclWKMmysWmuwtCfkLsRqxSU5sW/wGE
	Zvbc3hJ19g2ssWcD0eMHNB2kwetY0UfRU5oTfrx0g7HVlG6mb/hGC0yZHZJVDjyrub07y7Z5RWfuS
	7pmg2fN6/VlDEk07hFEQoOAkDh1mwzmtjJwAViv/xJRGUtgAskhaEa8OV0ESQzpgqtvq0qZ8QR2S+
	SFi8CowDPpP59yhctNVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2bl-0000000C8fH-3Z0O;
	Thu, 19 Nov 2026 13:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2bk-0000000C8ew-2q3y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:55:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A29D260D0F;
	Thu, 19 Nov 2026 13:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FF31F000C5;
	Thu, 19 Nov 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096523;
	bh=6OcUjZbeewnbF2w76nF4BzgSzm7/aBPsfjvddk/XGKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hMxP0eevmtddEQR0d36kdAvQSPcV0SSMj4z4xfc9UZDgUfebbXO/cYiaJ7S8QZr4N
	 p/rouCuF9juLTu0uXk9HyLVl9/3G+rogh9UZTz+yjzTxp/irXWYeFvZhDioX5aaXEs
	 zl1iaU/RDOzlqbB/iBojpGux8uepI91KObo2+KT7VnuY47brIAb0SXwBLM/jYWluNx
	 E4nO8WoJvR0HRyj9CubDbfvOo18nG8LxbGkSEPvXpsPw9CFxYxwqOAEtf98tEjzxEj
	 5jiXYRqeUMQPXiOcC6Nn4k0rz3G4x65UXljm6zYAQdCIpolkkzQRPcJdLXXE2szfR6
	 3AUNSthC7V3qw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Philip Radford <philip.radford@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com
Subject: Re: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol table
Date: Thu, 19 Nov 2026 13:55:17 +0000
Message-ID: <179509633637.1254008.1621228754406865513.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116123153.2672631-1-philip.radford@arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 12:31:51 +0000, Philip Radford wrote:
> Here is a short seires to address two SCMI bugs reported by Sashiko.
> 
> Patch [1/2] slightly alters logic to avoid using an uninitialized
> reg_io_width value when selecting shared memory accessors.
> 
> Patch [2/2] handles missing SCMI protocol ID tables in registration and
> unregistration paths.
> 
> [...]

Hi Philip,

Please avoid using bug report as subject line also. I have rebased the
change on for-next/arm_fw/updates as I have moved files. Also I did
rewrite a bit of commit message and kept !id_table check consistent
across register and unregister. Please check the branch and shout if
you disagree.

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
      https://git.kernel.org/sudeep.holla/c/8db620083cf2
[2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
      https://git.kernel.org/sudeep.holla/c/99e55aac0f9c
-- 
Regards,
Sudeep


