Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E580606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsOmcwEw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XE2hp+sb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wJwAkURIZ7mfzvHLxCw3lsSHYOHjF0J1FyU3YtX4AQM=; b=rsOmcwEwPD/sxDYbHIwY/evl1i
	iLVuCl6hfHovz05Kms/xKBo317Io0aJ4CGFy89Lp6slxu95OpF9NHbZ1FFqJTX9roG4iiQUHLQQNl
	pHrh8GEgJxuC2f/9IJlBSclSXhVAA0Sb3gyS4ZoQyePR3P4ncElXrb1qukaP2+yh4YS/tY/fZZMAi
	1jP6S45CofEWhv7rnaoQesCFAEaQsT63P9thMSkBCsspRG0+pkuE7vV0hdHi0ar//R+XmxZ370DHX
	htpKuzVCGnBQTi9SCBSz6IKF1/dOH1Borivs1KIbZCbiqHSpRMqK0yryuWIMgowY+9/Q3PdJRbacA
	OoB3xcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRe8N-0000000BF4G-1btB;
	Thu, 12 Nov 2026 23:23:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRe8K-0000000BF3w-1aKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794525787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wJwAkURIZ7mfzvHLxCw3lsSHYOHjF0J1FyU3YtX4AQM=;
	b=XE2hp+sb7Aw1fI4vzdfhIsTCLuybg+35AxLy/B/JzWfPkboKuhd+kfbmle/bpyDU5aQHKf
	zv50N4x2yZxrmlVDMDM7891Kmk/wKvw8ru1ReTB2AwS1O4nJh2YFy/XGlhtdYY8N4+9wdv
	vKY3MiMqXDPjclMY1Dgd9mVf3bbZ9AU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-LJMFJFViPEKwHNlVh9cRuQ-1; Thu,
 12 Nov 2026 18:23:05 -0500
X-MC-Unique: LJMFJFViPEKwHNlVh9cRuQ-1
X-Mimecast-MFC-AGG-ID: LJMFJFViPEKwHNlVh9cRuQ_1794525784
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0EF71956060;
	Thu, 12 Nov 2026 23:23:03 +0000 (UTC)
Received: from [172.20.178.129] (unknown [10.30.44.133])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E9611800446;
	Thu, 12 Nov 2026 23:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 8 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, 18f2d01b)
Date: Thu, 12 Nov 2026 23:23:02 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <90956.126111218230500310@us-mta-641.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ln71cFrOWnYANKl6eiAQ54RBTdM3zGKKpBjQ3JJG0gw_1794525784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_152308_592142_2CA77DBA 
X-CRM114-Status: UNSURE (   7.42  )
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
    Commit message: arm64: kexec_file: Do not use CMA for images with a non=
-zero text_offset

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3061646081

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


