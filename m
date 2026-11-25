Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmRgT83s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xv6MrqUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GoqdCC8tIFPmrJzFHHF3QY2vJ+uA0s0zbdcCKFPsKHY=; b=bmRgT83smRV0zetQncqRMYKMvO
	zaP1L7CFG2uQQnBGPIKnAK9JPoIxQDR7pu26z9j8xzlDEr0hI3wTtjVP3LqhX3oMgBVviYwwwxTim
	PbtyL07wpwn8HFW5oE3lr6SwMu1kIAYDnl+tOsfE2DFC4Z0uAubtCAuW245rLDMdnETIeySBAfavd
	mOmp2dzB6lqkpFd/zViSHjnq79F2PCogZMP8vdGbP/mUfs28jhRGcTx08kJwlzGZKXaUgy6GAtxtU
	7cwkk8AAftX2haKPDIFIYLfLn49s9XC6+o3NcndkQewnf53yspJTxUeahtTGXO/WtHm9b4dJzaOMN
	JO3F3TOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFvs-0000000Aa8Q-1afD;
	Wed, 25 Nov 2026 16:33:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFvj-0000000Aa5f-0Ijd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795624389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GoqdCC8tIFPmrJzFHHF3QY2vJ+uA0s0zbdcCKFPsKHY=;
	b=Xv6MrqUc3CiLehnoI5049DnV5Gfkpco1eQrHJ5uQmpY1xV9lqoRIspialRodNlRc3IuVll
	NawkRN9fXMrkk6ISE6MJCM7rb3o8g9/DwhrzxRCw6JD/sDW/6BZG4GcpK3l/e/QkpiCc1t
	WBrpK1nV1yHCkR/GIFM7uAHvl4WCv4Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-7LdI8JjzPt6YxSFuP1RKoQ-1; Wed,
 25 Nov 2026 16:33:05 +0000
X-MC-Unique: 7LdI8JjzPt6YxSFuP1RKoQ-1
X-Mimecast-MFC-AGG-ID: 7LdI8JjzPt6YxSFuP1RKoQ_1795624384
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 736461956049;
	Wed, 25 Nov 2026 16:33:03 +0000 (UTC)
Received: from [172.20.61.209] (unknown [10.30.45.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E90C346;
	Wed, 25 Nov 2026 16:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 8 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, a7e63249)
Date: Wed, 25 Nov 2026 16:33:02 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <47970.126112511330500615@us-mta-82.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: syCRbNSfbuE4M02OspRmD20fy0KCFmzsUPiD_VJbzx4_1795624384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_083317_253010_59AC005E 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: arm64: module: Use text-poke for late PLT/veneer emissi=
on

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3113976325

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]
        Issue: selinux-policy: serge-testsuite: Client ioctl BINDER_WRITE_R=
EAD error: Invalid argument
            URL: https://lore.kernel.org/selinux/CAAUqJDt1pXQ2KVBvMoMiDrzz8=
ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com/T/
            Affected tests:
                selinux-policy: serge-testsuite [aarch64]


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


