Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V8m72HUd;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=UGaDePJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Unsubscribe-Post:
	List-Owner; bh=3lfe9XJVUJqfZUNmYUWNzH3GfRtqf9Bz2S5w2J9v1J4=; b=V8m72HUd5RyS8p
	Tlr7bjjP7QyA0uftawbH+UXUjeplhIkIZis+d9mvNu8OsQnUOGqE5JPpSKBzx0CkXXaQgZ9+eNvC2
	dwa3vAzo1Nu+QqsdwoY2l9ekyag3gzduv52/8egRah8LWqT5ZmizLAOazcpyJRxGvgzZJ0Ggvcwgf
	ne03oqE5b2r49ARjnlht8vmMA8MPdeqbtXTJ1SyNdp4vhBAnUFi1KgJJshfYsbgT0iqh3yPBX5SFD
	9P6r3bO6bafcicuOlbRJSphmkkVm4hKqS9wqLwzN9G0LbXjWkHIdPYvcqqkOn/IseDEPfua3apw9H
	ATE9n341VoEvtgKaFUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtY1-000000054Gz-3ncr;
	Tue, 10 Nov 2026 21:38:33 +0000
Received: from sonic-euwe1-0017.asd.mail.yahoo.com ([34.2.82.16] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtXz-000000054GH-29l7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794346709; bh=3lfe9XJVUJqfZUNmYUWNzH3GfRtqf9Bz2S5w2J9v1J4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=UGaDePJs00KsuTOr3tIpzsh5+Rryq2fcaaM24As3xOr3w2cRIdLGJ+TbWdCQb7qjRaZuWl4jwWs/LrkSFsG3VxML4xPQcI8j3QgDdf2zq/+JFzytoA9MW5Bx/9W3Stf4sW1UQpncGTsXcqt+di5Ce0YsIYA17sx+XAzqJ9IDVbXoo2AyjokiH7lvVUPynKd1RFQnkcwsBtwPsN1CJE4q51xCApOf237i1pHPqTWEFdBFp1JIPPJwjEK9Y+8uHJ6zlFhOB+kDpZ3CQhe4PDv/IqMhqyT53FJ4/woDVknWOi0q3HKGemR8Dp1BasKzJ8OAIPDF/nj8N2pKA6bMcNs8nQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794346709; bh=ddd213/xIuRaYTIRNw+4cj765E2PTX1AmQKuovn7ZSW=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=ZZ9ANuS7czr9vC+LjXvMWekfDvx3a+IpHwcWV633NXwLfkX9IHpTs0qce8vVis0I8RiFCkqrAudOF3cReFFZCKgz+WEGsYC8h8IVJebZWwRXUQZD+eVzKb+U/f8tIzdPYSVAp4Q7xpWDuKyENATPy1STVr8T440uNPoSUyieMzfWh/m1CJ3OJ0WoOvKyff7HfkVbDZM6ehpoXFq8+lF6CfXZDq/3INY5PVAlZjvMzm7m25GTNE5IgNGOCRNC5H9kQDlnkMKwvsYlrkpcltYo5Wl6l+kNW+M73Tr34jUpG2kxM3enCLIJB+eC0iiayvDdRVRYDMszl0PdNmQljx1aKw==
X-YMail-OSG: lLQV0pAVM1nQtL48amN6Sf3PTFLD1QK18EGj4HPMjHByvyHVv030EPVoE5y2U9P
 OGI.eGVs7_HW7W9NyRJbifUinH8mBpxHPlBHxY.Xy7iUDLgm.UA9C3zLoE0dg1M6BiAmArCgC60D
 Llr9yFnMjBPm9IJKrgKewAfGqLIYn2ruJVDgZdHrY_jnYJCV8DcayOM3jiSZV4b34nUWzbnoKUp1
 pJ9wC46HanqVVs9qKXk254DMNGQYKbE8RNS78btXbg740kmqYhqOQiweWpgvml_lwZoZpqEeJwdo
 _uC6.K2ayccPFC5bmPBdjKp5SCc7HfnP5ghHlhgrv9oXNM58qPR1miNrOgkM60RoBnOqddUGFv9K
 QAzSiqrfEAwahxopwHHTeDTpgfdNA_9KCLqZlSFRK9CR_RcL6sjptYYxYZuS5BGHzKvzv53efcmT
 Judl5_qKU3d5Mg5nybWy6_fPctqwVZERQMloSAjU8lNNUeW5JPmRA.hudGh0y8jUXC4O4mryFhaU
 FMDIB7idGKwp9o4AebVNq_yBn.X4PTUqDeXqy806a70wwap545IRaf_fRyvpphQe3QyQwWzOBz6t
 nWDJmuuVbHeF7iYPoFvpfI877w49BIOq..Gpe8eQoE36tgD78xktHkSHUXobHxBNSbDv8NKDiDpj
 oEf7ugAT0P0f3sLYPWTNPfIVZyzCGc9jtArWpDUtjZAg7n9QH0n2gB8inXSZ8Q7WACWX.KlK_dr9
 UOxddzPZt0Xw4rpOsXT1cwBIA0260eZYN5MS3zB4Vd9dlAv1Y3pTDwoKFVPFwD52X0OO8WlpF_T_
 5KifNj_fcJN7fI7N0.tVu_.DjhoVmUukz6TPiQ1F9qhgiL1dZnPzEHCpemHgxUYi0GYa_hhmvBGw
 KOwCsDnzYHsfWU0NtaJIkJXqs4nOIxDUoR1Z10Vxvj4E3rs9PMG4ZyQXXxCo3T5CiWi69Q54Zg.D
 Z9b.pYpwVrOMy.ZERpWqni43UNvJ48jSb7j9MO1Qq4eDj1y1IdckwRe05mmeOVbwwFjp_7oIwB1.
 Csx9MMYHbszjrgeL9ZFSx05qLPhzw.zECLgP..Hi9JxUjUXhGx86BFwzH6jsT6JnxvxHPS9OZHk9
 nSjsgW1JixqgnVVoKzR_OC3CeYDuhQ5P9Bk3StQdm7pLFhEK4UHE4R5Cjf7nLuuafblX7xdPfTn9
 6K_Rip4hmRvfNHdhu0bgdmUzGHuQ3_bf_5o.rDGfh7wRgvp294Ek3WFQ50an7ZQAOnL.KdQ85QAR
 yH9B9Tsg_0vZb41fxv9pMjbzCi7z5VTFc435PXBSPghWdn5ZodDInPWf6n2wTS.VLMFtCavyZw6d
 awlGZnDmomRRTC2GA2Ql1Ju1Z8NnuAsh4cvImL9Y6.sRMVD3RGAGpFD1DwZxBkXTZLMeT3wHQJOx
 rk3Efosdz5fKSLrngTW39kUYB8JkVLx2j5Mbv0eUXeDwBRzjM_dQ5Y0GA0bg9IiTsEO4FUJD81Y1
 SrUYGj8y._ki6jYWRrtX7tyeRRyLAebIebUXtkbOIiJ2aCArs4OcxaL1QQaDyELt2Lc7dFaDZ39m
 T.mrOweteyCgaxyKM6oPV62hh0kKkGk67qgu3HSj5FpnMtvBSVm_YZ5DSDW9curCCzevqIUjZbNa
 .V3OVQ.JC0tulwlgDbijoSZVCXspTzuiQ_SacAiaupBMje3OHKQRMnYchDQg8_GUWSJocSKqHDCK
 WpjsmcYhCJY0TOB0a6k3Mm_Drj_xDD2O5ZMbp202KX5l8mXDRYq6dC3gKZkMvXq7mEkvmL1sAxtE
 bNtN40H4kh7yUXnQb3sw6WCUi39H_WZ2YcUzhPcM7Pr3ONi3GvtKTvXc5BrbquGbZC_0_SbMy8WU
 G87u1C6iQbODA_MFYZuKKKr0tguk3YicOIjSik5hkjWbsO2h6d8Oxlp.mF6QY5OLwgaW88NsORGv
 t8tTmNV4a_PClYWFl05b7pB9mOwxGE2k3B.nRdVBnU_f2G2IGUhlDpnOEleYkOICE0BJ0GCCAvh7
 VMNyPxjHknNcpGEv6Ap9fC21O2ywKqc3TeAYmr7S_il.j82A-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: dc14178d-7249-4e31-afcc-73bcccc1e5b8
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-103 with HTTP; Tue, 10 Nov 2026 21:38:29 +0000
Received: from dip99.lsn.ir2.yahoo.com ([87.248.99.108])
          by hello (SMTP) with SMTP ID 2a421b6be2aeaa0fde31ced0cdbc5213;
          Tue, 10 Nov 2026 21:38:26 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Nov 2026 22:38:25 +0100
Subject: [PATCH] platform/raspberrypi: vchiq: Fix kernel-doc Return section
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gYmoi32KsWFZmJNC2Ob0UEQ7
 +60Xb7F/ztEMZUIt2IHk6RR55BBZQE89eEhqD4bKlddiMhh4kk/6CXhy8+MJstqAZuhb+uW/HV
 0DLl9m4y6/b737u+4Dk/h5TuD4zgB8y+JNXkAAAA=
X-Change-ID: 20261110-vchiq-dev-kdoc-return-5ba9491d7f0c
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794346705; l=1419;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=U2NK5ps0z0iNnAb83TqN2kqEkdvH3JTkXiDpRRw1NEg=;
 b=qLvxmRBg++uSG7Uvc4UhIiTlIMQlQEvqzAhszBGUsyynmVkxEGVkFpmSPsCkeoZI7qjIMln6/
 m45tXNF5jdRA9m4JkqUQhc0qNukJxrolDXXudu1arbVsAhWrNtj5QuY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac.ref@yahoo.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_133831_708983_B6C9F8BE 
X-CRM114-Status: GOOD (  11.29  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scripts/kernel-doc -Wall reports that vchiq_register_chrdev() has no
description of its return value:

  Warning: drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:1341
  No description found for return value of 'vchiq_register_chrdev'

The comment does describe it, but in a free-form "Returns 0 on success
..." sentence that kernel-doc does not recognize. Convert it to a
"Return:" section.

No functional change.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
index f1c9c0d4b96a..7dfeebbf34d3 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
@@ -1336,7 +1336,7 @@ static struct miscdevice vchiq_miscdev = {
  *				device files in userspace.
  *	@parent:	The parent of the char device.
  *
- *	Returns 0 on success else returns the error code.
+ *	Return: 0 on success, or a negative error code on failure.
  */
 int vchiq_register_chrdev(struct device *parent)
 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-vchiq-dev-kdoc-return-5ba9491d7f0c

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


