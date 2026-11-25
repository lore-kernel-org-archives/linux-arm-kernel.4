Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99494606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 01:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ICmS8PU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O32xF5c5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hm2wuQFLmV9LQkNdJSRDFRXDMHH9iqFd/UmD1zt28t8=; b=2ICmS8PUVt40JSI0p4HM7yINdR
	0elVUU759GYtSzwAceCmEPSQnkqnv4EOPDzgzXScHbzRE2f5Jj75mOz4cjowJvSDFs2W8RFf3QQFG
	G/FGs99dXaWKBx71mRYQhFEKTN7dYzd72V0YZlq52MBumzlBNinrwVfxrAXkKX+uhEpGpCHkHf+O3
	GDO/rdMz+DBwx+64E7SW2Nh+YX0rFx4jq2Wa8ZMlQOHL+/LJZDBZl4GBqW7r8TZJ688DcRf3p//HS
	mEcUC3vi7NJnCqFbGbzbGqbgECNkqMN0AfjVXSqjWZpW+gpa52nUF39gwIe6hWhbKWfmEFlB8ZPbC
	rhqzulVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2FQ-00000008DR7-3crY;
	Wed, 25 Nov 2026 01:56:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2FO-00000008DQm-12v2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 01:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795571792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hm2wuQFLmV9LQkNdJSRDFRXDMHH9iqFd/UmD1zt28t8=;
	b=O32xF5c5qDJMVhjteKEEbAAdb2A1ZjpwBka/QW4u7+rHVopoIKj2DFELwpKkKlq7o1uftU
	bCq/0Ms8wWtdW47wNd6Z2E75GCX4tJPWtOoqcxSZz0GURF3RpVKr1+AnvPmJ9kcy2/iImO
	qNGrrtbm3HTxUFlS9eZjhtmGA7c7IXo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-jE-MGSAOPwOTFB2-Evq3dg-1; Wed,
 25 Nov 2026 01:56:30 +0000
X-MC-Unique: jE-MGSAOPwOTFB2-Evq3dg-1
X-Mimecast-MFC-AGG-ID: jE-MGSAOPwOTFB2-Evq3dg_1795571789
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B587180049D;
	Wed, 25 Nov 2026 01:56:28 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11DBA30001A2;
	Wed, 25 Nov 2026 01:56:25 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Wed, 25 Nov 2026 02:56:18 +0100
Message-ID: <20261125015618.1331650-1-jhladky@redhat.com>
In-Reply-To: <20261124233043.1289050-1-jhladky@redhat.com>
References: <20261124233043.1289050-1-jhladky@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: al6oplMidCg2UVYidthKJGQEzgf8amR8-rlsNFv9RlE_1795571789
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_175634_453219_E95131F0 
X-CRM114-Status: GOOD (  10.21  )
X-Spam-Score: -2.8 (--)
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

Hi Will,

Some additional measurements supporting the patch, to quantify the
impact beyond the /dev/zero benchmark. Since the fixed loop is the
generic zero-fill-to-userspace primitive (clear_user() /
iov_iter_zero()), the impact scales with the number of zero-filled
bytes in any workload. Same A/B pair as the commit message (Ampere
Altra, Neoverse N1, two kernels built from one tree, differing only
in the label move):

O_DIRECT read of a sparse NTFS3 file (2 GiB, fully sparse; ntfs3
zero-fills such reads directly into the user buffer via
iov_iter_zero(), no page cache involved):

  kernel instructions per MiB:    791.1k -> 528.8k
  throughput:                     11.9 GB/s -> 25.6 GB/s (+116%)

The instruction delta is again exactly the two removed NOPs (262.3k
per MiB at 8 bytes per iteration). The gain is larger than for
/dev/zero (+92%) because ntfs3 zero-fills the whole 1 MiB read in a
single clear_user() call, while read_zero() clears in 4 KiB chunks.

/proc/kcore read (1 GiB): 1064.4k -> 990.7k kernel instructions per
MiB (-6.9%), throughput unchanged, as the remaining ~72% of kcore
bytes are real memory copies. The arithmetic implies about 28% of
/proc/kcore read bytes are zero-filled holes.

For completeness, tmpfs hole reads do not benefit: mm/shmem.c
deliberately copies the zero page instead of calling clear_user()
("Copy to user tends to be so well optimized, but clear_user() not
so much, that it is noticeably faster to copy the zero page instead
of clearing"), which reads like an existing workaround for exactly
the cost this patch removes.

By code inspection, the same zero-fill path serves sparse reads on
Ceph, SMB and netfs, so those are the likely real-world
beneficiaries.

Jirka


