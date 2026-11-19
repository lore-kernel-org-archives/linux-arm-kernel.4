Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F070F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GOLwnu+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8Cw1Hns
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KRSS0YC2+ajWi5ptCX9I4lcy2eVuBm7blHyhptRtr58=; b=1GOLwnu+9mji6T
	mytaXrOnraZu83SzMRCrpOyb1tGqXYGZiOB/dJ9rRxUz+f6n810CIJqRUbhTRtgwzxuHrNTnFSz//
	09M8spNJ4ZotkQNg9LBp3gyzFuIUYqsYdeHMmYZO9Hf4Z/ry2tXInSBO8IVS4MOcCYr8PnfyMvFI2
	Nong3CPyGzenWWiRIgmiCDKvYLtAsq9RngXBm7gBXBcISELtUzjEAzRdOPRlH/CBX2mEMsDBp84wW
	xvp0MSnIomOnmRbqO3CbnvmcHnj2aPmKqneYNncegT2Yhh7bO/EGpTtXu2x/AagxtK2cclk8H0GUj
	KnDpXQ7GqMt98GxZsfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1ru-0000000BzVL-1zZg;
	Thu, 19 Nov 2026 13:08:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1rt-0000000BzV0-1PwP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:08:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87E62618B4;
	Thu, 19 Nov 2026 13:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187CE1F000C4;
	Thu, 19 Nov 2026 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093680;
	bh=KRSS0YC2+ajWi5ptCX9I4lcy2eVuBm7blHyhptRtr58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k8Cw1Hnsk6FHlJyxFwRkaDJPGexjFGr895QxBI1t0tj8BMpxIsCzay2CHoGKWybIw
	 1YUtKfLKfg8YQxkCERL7B+mHFy7TtoHMMdaeMSWNCubKzGmpgEDWusAEi8S4lKcfQS
	 YawmaJ+J5Qs7VGcLuOX3m3SI9mMW6yVxcnITK6QkesPM1bSGdEzJXwYBqGUiube6MQ
	 P/fybJQvJ4frigZXyTx3S4hRn+045hXY1htQXeYiPaWCyhyO9433xevfqGuS8gtcxT
	 XTL18YIgDLpckVtVMKd3n+O4LBacGRXfq/NZjVxRF7osQAibb/BWNEjMJl0pw0aXa7
	 KovnoNIpub6gg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
Date: Thu, 19 Nov 2026 13:07:55 +0000
Message-ID: <179509361319.1241838.7050964033270198334.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105112705.3045759-1-sudeep.holla@kernel.org>
References: <20261105112705.3045759-1-sudeep.holla@kernel.org>
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

On Thu, 05 Nov 2026 11:27:05 +0000, Sudeep Holla wrote:
> In scmi_pinctrl_attributes(), the return value of extended_name_get()
> is returned directly. If PINCTRL_NAME_GET failed, the error propagated
> to callers -  aborting pin/group/function descriptor initialization,
> despite the short name already being available in name.
> 
> Discard the return value of extended_name_get() and return success as
> intended unconditionally after the successful PINCTRL_ATTRIBUTES
> transfer. On failure, extended_name_get() won't have overwritten name,
> so the short name copied from rx->name remains intact, which is exactly
> the fallback behavior described by the existing comment.
> 
> [...]

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/1] firmware: arm_scmi: Fix fallback to short name in scmi_pinctrl_attributes()
      https://git.kernel.org/sudeep.holla/c/6337e8d465bb
-- 
Regards,
Sudeep


