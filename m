Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kd0HEexw;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dQ//ZzV4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YB/cyfjwX/52y3Ipa9lzbgUaTU+EJUYgc2Tz4cscnfI=; b=Kd0HEexwdZERag
	jyAEGLDZzfPVLboYMi9pSfwZ+OKcwY8fH7IQ4YixTW7gAmxc1Hvqyv3tNGmMa+Y65zL5FqoSQ2ayj
	Ug7azOkUxNCkCCpIDS3NSxe+RMYn6c2F7kkj7Kb4/NuXWNW6qof1Z1H5XHuJqQShnC6HsGi1SlQVQ
	Q073hVc9ZpooaqksHrDqLg3Gv5yaDW2+e7llbdzwRyMhJKzzxxWj1SNalUhEeraUa1RQeaN4qRUfB
	TGgvJTTUW8YAVSr6NRXkE7yM3TwKD0Br6Bu673jCKZzQt4tvbbVFV/1s5QEVXC9KsrTfxaWd/VooF
	DB3czELDPpNCdectkD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvLA-0000000Axqo-2qYJ;
	Thu, 19 Nov 2026 06:09:48 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvL6-0000000Axq8-0nTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 06:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dQ//ZzV4xlquiGr1FA/sWCa+NdL1j41kQvTmi24R1ZHYIxJeAFA/qpC1K66GgKXKIywwXgrFxQZyf
	 Z0MD+EiL7pxehlf3eJu/R8dAhsMsjoTM2gIZD0YkAjSOVZIlstW0juPOBfFtAkHunMeRWvFgDAg0iL
	 dHDIRLnA4zFhZcUs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afe92956cd-f61f4;
	Thu, 19 Nov 2026 14:09:26 +0800 (CST)
X-RM-TRANSID: 2ee16afe92956cd-f61f4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afe9294463-f1e52;
	Thu, 19 Nov 2026 14:09:26 +0800 (CST)
X-RM-TRANSID: 2ee16afe9294463-f1e52
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Thu, 19 Nov 2026 14:09:24 +0800
Message-ID: <20261119060924.675-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
References: <CAD++jLn1P9hT-YH9vM9VSvoMRei5LJv+hDZMH1en6CfFXPB-5w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_220944_843850_66F2D5DD 
X-CRM114-Status: GOOD (  16.68  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

thanks for taking a look.  For the record, this is about "[PATCH v2]
pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error
paths":

https://lore.kernel.org/all/20261110083253.1525-1-laixiangwu@cmss.chinamobile.com/

On Wed, Nov 18, 2026 at 10:09:40PM +0100, Linus Walleij wrote:
> Fix your email address in .gitconfig please so you don't use
> your login name as name.

Sorry about that.  The email address is unchanged, what was wrong is
that git picked my login handle up as the user name; the .gitconfig
name is set to "Xiangwu Lai" now, and the patch was already resent
with the corrected author and sign-off before your reply arrived - it
is identical to v2 otherwise:

[PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
https://lore.kernel.org/all/20261116031043.502-1-laixiangwu@cmss.chinamobile.com/

On Wed, Nov 18, 2026 at 10:08:09PM +0100, Linus Walleij wrote:
> Looks like a bulky fix, what about just stop using
> of_reset_control_get_exclusive()
> and use devm_reset_control_get_exclusive(&pdev->dev, ..) hmm?

The managed getter is unfortunately not a drop-in replacement here:
the reset phandles live in the per-bank child nodes, while
devm_reset_control_get_exclusive() resolves the "resets" property
from dev_fwnode(&pdev->dev), that is the pinctrl node itself.  The
driver fetches one reset line per GPIO bank from each child:

	bank->rstc = of_reset_control_get_exclusive(np, NULL);

with np = to_of_node(child).  The reset core only provides devm
variants that take a struct device *; there is no devm getter
parameterized by a device_node/fwnode, which is what the per-bank
lookup would need.

If you prefer the managed form, the equivalent that keeps the
child-node lookup would be to register the put as a devm action after
each successful get:

	static void stm32_pctl_put_reset_control(void *data)
	{
		reset_control_put(data);
	}

	bank->rstc = of_reset_control_get_exclusive(np, NULL);
	if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
		...
		return -EPROBE_DEFER;
	}

	ret = devm_add_action_or_reset(dev, stm32_pctl_put_reset_control,
				       bank->rstc);

which turns all the error paths back into plain returns - devres
releases the rstcs acquired so far - and removes the goto
err_put_rstcs wiring from v3.  On success the semantics stay as they
are: the rstcs are held for the lifetime of the device (the driver
has no .remove) and are still in use, stm32_gpiolib_register_bank()
deasserts them.  phy-qcom-qmp-pcie-msm8996.c uses the same
combination for the same reason, a reset phandle living in a
sub-node.

Philipp, does this look sane from the reset core point of view, or
would a devm getter that takes a fwnode be something acceptable in
the core?

I can respin a v4 with the devm action conversion on top of v3, or
keep the explicit unwind of v3 - let me know which form you prefer.

Best regards,
Xiangwu Lai



