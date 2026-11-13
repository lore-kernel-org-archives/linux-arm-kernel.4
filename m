Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F5606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SgS0SPbP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ELviE2qh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QRKjoaIFdZcdNI6xhQFS3ddkteDcVtqc9gdnFl/fkT8=; b=SgS0SPbPSSF3G+xO9Dc+iR3ms6
	UOeOZimv58XfhtovYJU/nA3f1f56hDgCObR9vBDK4fBp7o58upcs1ysRwFiRYiK1RO0kEEdqtBkrM
	TL0CPA8PpUihUarYrThe4YggUVhn575O3JpjMWzsmCIkzAlyBF2N8TtemPCKmQ1vLTfKRsYEyHb7T
	GmQCUhgf0BWd3+5c+xa1Vgps6uRxc8d4/jjqdSzXLZkDcmpLy4jLa91riZx17EsfoyTb6NhjDMhOV
	ZjYuUEjsc+leq3gqz6p8o39a2AuWzudHtgY3ra1oGONJSQ8mG9nckUv7Pth/e2elHbYREHVbaojtA
	GscSl0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpki-0000000CZl0-2Yc1;
	Fri, 13 Nov 2026 11:47:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpkh-0000000CZkq-32eQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 173CF6183A;
	Fri, 13 Nov 2026 11:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C3E1F000C4;
	Fri, 13 Nov 2026 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794570450;
	bh=QRKjoaIFdZcdNI6xhQFS3ddkteDcVtqc9gdnFl/fkT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ELviE2qhjHKkgD7NBAi295Va5GnITUxC5rM/CetbA9/lc6h4Xl32j7t1F65j4uzUf
	 C+mpzF9848sWd9EwDQ/LPFTT4biPOKLxmKgsg+ABasx66tUUaMe1CEn8S9r+7RqPcH
	 YCGQhMcViMCz1gR+TyesYhxplyLR9BOkD602l02N6pzIvYY2GLvaDwe1e7DKMTRegf
	 nj15n8UJn6Y3EhCUZbAMd/y1K9rlXCWxA+s7KK72dHv9GYMEqqAeW2clqWpMhhv2Sv
	 TOCktHbmUynvB5U+fAntaw/5z/5yn54RrKJ/UL7kKwGlA0J/+aE4KemAyBtzOjPhod
	 lrpklC+/uvkEQ==
From: netdev-bot+sinfo@kernel.org
To: Haoran Wang <haoranwangsec@gmail.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: sparx5: check DT port reg against array size
Date: Fri, 13 Nov 2026 11:47:29 +0000
Message-ID: <179457044999.2168702.11721926329454503825@kernel.org>
In-Reply-To: <179457014579.23820.10657909253312598784@gmail.com>
References: <179457014579.23820.10657909253312598784@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

