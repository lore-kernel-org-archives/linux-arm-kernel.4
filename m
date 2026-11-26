Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kmjOh0Bk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frJjFcdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MFJC3lZta42EoWYZ9uai4g8tEU5mD20dpu/kyWIXrgw=; b=kmjOh0Bk5I163oTyePlf5TP81b
	+Z3+ztxo4wSl1aV62PaCWNwEiRKkmQ1UkTGDYarYQ5zzJn+5DMQMQQ6biLJq98zZmzN5bjXKOndE6
	Yo3WuBDDfCUv27qRPHY9gDIJmEU3W8zsXcQssvUtrvAxtgPQX5gkJn04URNo+VizykILTdcp+FloW
	w3+PBm6m2cI82dVVhyFcZMg+vx8CvMhum5TyjEgEOMCU+AXegljZqzDDjKn+WqlWGHAHjSusKjQFh
	lrq49Lht5vnD1d87DiMTyA8YorPauJfd22/n1ypC5zijb+V+iC8D5adwTyKno+BhOincp9hBjfZ6k
	qgZRsWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcii-0000000DyTD-1F7g;
	Thu, 26 Nov 2026 16:53:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcif-0000000DyRw-1qaF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795711990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MFJC3lZta42EoWYZ9uai4g8tEU5mD20dpu/kyWIXrgw=;
	b=frJjFcdluXot/PwiIwq0kwX9odOg1T9LXV4yFSy95kty7iDBQd2ww4pXgi5IY9O/+oq+5L
	EtQOmZKh2WhhhpvTAHypuVvaddCQWdBCaRumpHlwBg1h3RyRz4VQVYNpRmIyNBoD+yYU9X
	QRfSC0V4UTWfODWZeSaotIp8Z6/zt1k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-ebYl3f4DMxSuAKcjmbtlVQ-1; Thu,
 26 Nov 2026 16:53:08 +0000
X-MC-Unique: ebYl3f4DMxSuAKcjmbtlVQ-1
X-Mimecast-MFC-AGG-ID: ebYl3f4DMxSuAKcjmbtlVQ_1795711987
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7225F1956042;
	Thu, 26 Nov 2026 16:53:07 +0000 (UTC)
Received: from [172.20.78.93] (unknown [10.30.44.111])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6F41346;
	Thu, 26 Nov 2026 16:53:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 24 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, 18817028)
Date: Thu, 26 Nov 2026 16:53:06 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, ftjahjad@redhat.com, bgoncalv@redhat.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <30420.126112611530801255@us-mta-632.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a4oo2vsXvlcbhoHFc8PtH9NFbw_L38DP3Dgbzr73b0s_1795711987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_085313_629971_6972BC6D 
X-CRM114-Status: UNSURE (   6.96  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: arm64: fixmap: fix missing break-before-make in __set_f=
ixmap()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3118945314

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3118945314_aarch64_kernel_kcidb_tool_1200796534_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
                       =E2=9A=A1 ERROR Warn: None
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3118945314_aarch64_kernel_kcidb_tool_1200796535_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
                       =E2=9A=A1 ERROR Warn: None
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3118945314_aarch64_kernel_kcidb_tool_1200796536_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
                       =E2=9A=A1 ERROR Warn: None
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3118945314_aarch64_kernel_kcidb_tool_1200796537_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
                       =E2=9A=A1 ERROR Warn: None
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3118945314_aarch64_kernel_kcidb_tool_1200796784_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
                       =E2=9A=A1 ERROR Warn: None


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Hardware - Firmware test suite [aarch64]
    Reboot test [aarch64]
    selinux-policy: serge-testsuite [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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


