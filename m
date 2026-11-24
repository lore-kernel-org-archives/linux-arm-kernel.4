Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A68606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xAz8y3pA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gSB4jNEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QWGvzPpYWLrHjwLeDxSm7nXRTt1ieW4I3yri6RDwek4=; b=xAz8y3pA/SmAZlV+h8OBwkUIaZ
	D0V7JTsEZmn7fNhRVs6XcCMXSa79uyZ2y1M7WS7+V7TkMn4DfzhVCP37jh3X58nfj1qI9EjFfiA/U
	1rlPEl8zriGB72XVF7dyYO0+E0APe44VFTL9kmW6FG+NmZfPyrDwolMvc6q4HfrgjSH0/3wHB0LZV
	vXmCmxUh1jdGvCTK5G3cTDiymU/yxp4jOKNIcnKpQNuOYY+prxTbPKsLQjEz2SyjgbbwQL2SuPhYf
	xDQtb7NDOKtXVLdGEGlg9XgziaxFASghjbAY5KISdrC9uVWfdn7tr8tHe4zWp8oTEDOxlvRLksEWU
	IcV8rl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0LQ-000000086Gp-2GG0;
	Tue, 24 Nov 2026 23:54:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0LN-000000086GT-2M9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795564474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWGvzPpYWLrHjwLeDxSm7nXRTt1ieW4I3yri6RDwek4=;
	b=gSB4jNEXHgT7xl8iAN5P4Uo3uE2yc1PAGOR/asm9asHapR+pGT9P93iZLjSWkvsQ+pUtAK
	7oJP9fMabvhUe+wm1RvN2bCfs/aGs1LbPDJ2ur0P21ewm/m23jo2333e4L2LzJE6cpOQ3M
	climyV5yI2PI1sRI0Y6QJRPe5TPdpC8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-NpUdX5X0OVGaDfU1Q91OYg-1; Tue,
 24 Nov 2026 23:54:30 +0000
X-MC-Unique: NpUdX5X0OVGaDfU1Q91OYg-1
X-Mimecast-MFC-AGG-ID: NpUdX5X0OVGaDfU1Q91OYg_1795564469
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43C4219560B8;
	Tue, 24 Nov 2026 23:54:29 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACC51195B3C0;
	Tue, 24 Nov 2026 23:54:26 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: dockseed@proton.me
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for I-cache efficiency
Date: Wed, 25 Nov 2026 00:54:20 +0100
Message-ID: <20261124235420.1299547-1-jhladky@redhat.com>
In-Reply-To: <h2Yz7IeYKGRjKTvtyae9lgHZIlzgU1Ze5lPbucMya5_pi5-E78h2z8BgJHbZ0JG3ufYHoIE_2ax0hUF-_TDkXfXnPwhLilCyFV0NHh4GML4=@proton.me>
References: <h2Yz7IeYKGRjKTvtyae9lgHZIlzgU1Ze5lPbucMya5_pi5-E78h2z8BgJHbZ0JG3ufYHoIE_2ax0hUF-_TDkXfXnPwhLilCyFV0NHh4GML4=@proton.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ItJ0PhDHnwiw5eC5I4HUF_MHh9SY_96aSUf_WoTJM2M_1795564469
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155437_773689_EB1B1E9E 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: 0.5 (/)
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

Hi Norman,

Thank you for the excellent analysis, and for pinpointing that the
root cause is in clear_user.S itself rather than in where the
function lands.

We reproduced your findings on bare-metal Ampere Altra (Neoverse N1,
no FEAT_MOPS) and can confirm them end to end.

Disassembling __arch_clear_user() out of /proc/kcore on the running
kernels, both the ELN 7.3.0-65 and 7.4.0-0.rc3 builds we tested carry
exactly two NOPs between the loop-back branch target and the first
sttr, i.e. the padding you described.

To isolate the change, we built two kernels from the same tree, same
config and toolchain, differing only in the label move (your one-line
fix): the unpatched build has the two NOPs in the loop, the patched
build branches directly to the sttr. Reading 4 GiB from /dev/zero
(performance governor, pinned CPU, median of 3 runs):

                        unpatched     patched
  kernel instr/MiB        797.5k       536.4k
  throughput              11.6 GB/s    22.3 GB/s

The instruction counts match your measurements almost exactly, and
the delta (261.1k per MiB) is precisely the two NOPs at 8 bytes per
iteration (2 x 131072). On N1 the throughput effect is even larger
than on your A76: +92%.

The unpatched rebuild also reproduces the stock ELN kernel's numbers
exactly, so the only variable in the comparison above is the
one-line fix.

I have posted the reworked patch as [PATCH v2] in this thread:

  https://lore.kernel.org/all/20261124233043.1289050-1-jhladky@redhat.com/

with your diagnosis credited in the commit message and a Suggested-by
trailer.

Thanks again,
Jirka


